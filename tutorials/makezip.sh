#!/bin/bash

function zip_folders {
    for dir in ./*; do
        if [ -d ${dir} ]; then
            echo "Generating ${dir}.zip"
            zip -q -r ${dir} ${dir}
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

