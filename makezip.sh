#!/bin/bash

# ===============================================================================
# Environmental variables
#
TMP_FNAME="template_preamble.tex"
UP_FOLNAME="upload-dir"
# ===============================================================================

function del_logs {
    echo "Deleting unnecessary files"
    rm `find $1 | egrep '\.(log|aux|out|toc|tdo|bbl|blg|nav|snm)'`
}

# ===============================================================================
# Preparing publishing templates for zipping.
#
function prep_pub {
    cd $1 || return 1
    if [ `echo $1 | grep -q pub` ]; then
        echo "Deleting unnecessary files and folders"
        rm -r `ls -1 | egrep -v 'template'`
        cp -a template/* ./
        rm -r template
    fi
    cd ..
    del_logs $1
}
# ===============================================================================

# ===============================================================================
# Preparing tutorials for ziping
#
function prep_tutorials {
    cp template_preamble.tex ${1}
    texname=${1:3}
    sed -i "s/input{.\/\.\.\/${TMP_FNAME}}/input{\.\/${TMP_FNAME}}/" ${1}/${texname}.tex
    del_logs $1
}
# ===============================================================================

# ===============================================================================
# Preparing the common templates for zipping.
#
function prep_templates {
    del_logs $1
}
# ===============================================================================

# ===============================================================================
# Preparing the lecture material for zipping
#
function prep_templates {
    del_logs $1
}
# ===============================================================================

# ===============================================================================
# Function for moving the newly created zip files to a common directory
#
function zip_move {
    if [ ! -d ${UP_FOLNAME} ]; then
        mkdir ${UP_FOLNAME} || return 1
    fi
    if [ ! -d ${UP_FOLNAME}/${1} ]; then
        mkdir ${UP_FOLNAME}/${1} || return 1
    fi
    cd $1 || return 1
    for file in *.zip; do
        echo "Moving ${file} to the archive"
        mv ${file} ../${UP_FOLNAME}/${1}/${file}
    done;
    cd ..
    return 0
}
# ===============================================================================

# ===============================================================================
# Function for creating zip files
# 
function zip_folders {
    WORKING_DIR=$1
    cd ${WORKING_DIR} || return 1

    for dir in *; do
        if [ ! -d ${dir} ]; then
            continue
        fi

        echo "Making a backup dir for ${dir}"
        cp -a ${dir} ${dir}-backup || return 1

        if [[ "$1"=="tutorials" ]]; then
            prep_tutorials ${dir}
        elif [[ "$1"=="publishing" ]]; then
            prep_pub ${dir}
        elif [[ "$1"=="templates" ]]; then
            prep_templates ${dir}
        elif [[ "$1"=="lecture_material" ]]; then
            prep_templates ${dir}
        fi

        echo "Generating ${dir}.zip"
        zip -q -r ${dir} ${dir}
        rm -r ${dir}
        mv ${dir}-backup ${dir}
    done

    cd ..
    zip_move ${WORKING_DIR}
    return 0
}
# ===============================================================================

# ===============================================================================
# Function for uploading all scripts and then removing them
# 
function upload_zips {
    touch sftp_batch
    for object in ${UP_FOLNAME}/*; do
        echo "put -r ${object}" >> sftp_batch
    done
    echo "quit" >> sftp_batch
    echo "Uploading everything by sftp to my pwf webspace"
    sftp -o "batchmode no" -b sftp_batch ia277@linux.pwf.cam.ac.uk:public_html/ChemDptLaTeX/
    rm sftp_batch
    rm -r ${UP_FOLNAME}/*
    return 0
}
# ===============================================================================

# ===============================================================================
# Execution of the script and various options
#
case $1 in
    --zip|-z)
        zip_folders tutorials
        zip_folders templates
        zip_folders publishing
        zip_folders lecture_material
        ;;
    --clean|-c)
        clean_zips
        ;;
    --upload|-u)
        upload_zips
        ;;
    --help|-h|help|h)
        echo "Options for this script:"
        echo "     --zip   | -z  to compress all folders in this directory."
        echo "     --upload| -u  to upload all compressed files to a pwf webspace."
        echo "     --clean | -c  to delete all the .zip files in this directory."
        echo "     --help  | -h  to produce this help message."
        ;;
    *)
        echo "Please select the options"
        ;;
esac
# ===============================================================================

