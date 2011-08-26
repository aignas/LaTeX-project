#!/bin/bash

TMP_FNAME="template_preamble.tex"
ZIP_FOLNAME="zip_archive"

function zip_folders {
    WORKING_DIR=$1
    cd ${WORKING_DIR} || return 1

    for dir in *; do
        if [ ! -d ${dir} ]; then
            continue
        fi

        echo "Making a backup dir for ${dir}"
        cp -a ${dir} ${dir}-backup || return 1

        if [[ ! -z $2 && "$2"=="--include-macros" ]]; then
            cp template_preamble.tex ${dir}
            texname=${dir:3}
            sed -i "s/input{.\/\.\.\/${TMP_FNAME}}/input{\.\/${TMP_FNAME}}/" ${dir}/${texname}.tex
        fi

        cd ${dir}
        echo "Deleting unnecessary files"
        rm `ls -1 | egrep 'log|aux|out|toc|tdo|bbl|blg|nav|snm'`
        cd ..

        echo "Generating ${dir}.zip"
        zip -q -r ${dir} ${dir}
        rm -r ${dir}
        mv ${dir}-backup ${dir}
    done

    cd ..
    zip_move ${WORKING_DIR}
    return 0
}

function zip_move {
    if [ ! -d ${ZIP_FOLNAME} ]; then
        mkdir ${ZIP_FOLNAME} || return 1
    fi
    cd $1 || return 1
    for file in *.zip; do
        echo "Moving ${file} to the archive"
        mv ${file} ../${ZIP_FOLNAME}/${file}
    done;
    cd ..
    return 0
}

function clean_zips {
    cd ${ZIP_FOLNAME} || return 1
    for file in ./*.zip; do
        echo "Deleting ${file}"
        rm ${file}
    done
    return 0
}

function upload_zips {
    touch sftp_batch
    for file in ${ZIP_FOLNAME}/*.zip; do
        echo "put $file" >> sftp_batch
    done
    echo "quit" >> sftp_batch
    echo "Uploading files by sftp to my pwf webspace"
    sftp -o "batchmode no" -b sftp_batch ia277@linux.pwf.cam.ac.uk:public_html/
    rm sftp_batch
    return 0
}

case $1 in
    --zip|-z)
        zip_folders tutorials --include-macros
        zip_folders templates
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
        echo "     --clean | -c  to delete all the .zip files in this directory."
        echo "     --help  | -h  to produce this help message."
        ;;
    *)
        echo "Please select the options"
        ;;
esac

