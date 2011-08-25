#!/bin/bash

TMP_FNAME="template_preamble.tex"

function zip_folders {
    for dir in *; do
        if [ -d ${dir} ]; then
            echo "Making a backup dir for ${dir}"
            cp -a ${dir} ${dir}-backup || return 0
            cp template_preamble.tex ${dir}
            cd ${dir}
            texname=${dir:3}
            sed -i "s/input{.\/\.\.\/${TMP_FNAME}}/input{\.\/${TMP_FNAME}}/" ${texname}.tex
            echo "Deleting unnecessary files"
            rm `ls -1 | egrep 'log|aux|out|toc|tdo|bbl|blg|nav|snm'`
            cd ..
            echo "Generating ${dir}.zip"
            zip -q -r ${dir} ${dir}
            rm -r ${dir}
            mv ${dir}-backup ${dir}
        fi
    done
    return 0
}

function clean_zips {
    for file in ./*.zip; do
        echo "Deleting ${file}"
        rm ${file}
    done
    return 0
}

function upload_zips {
    for file in ./*.zip; do
        echo "Uploading ${file}"
    done
    return 0
}

case $1 in
    --zip|-z)
        zip_folders
        ;;
    --clean|-c)
        clean_zips
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

