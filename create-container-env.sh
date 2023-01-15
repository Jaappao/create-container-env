#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
PROJECT_FOLDER_NAME=$1

TYPES=$(ls $SCRIPT_DIR/dir-template)

select word in $TYPES
do
    EXEC_DIR=$(pwd)
    PROJECT_FOLDER_ABSPATH="${EXEC_DIR}/${PROJECT_FOLDER_NAME}" # 実行ディレクトリ以下に作る
    echo "Clone ${word} template as ${PROJECT_FOLDER_ABSPATH}"

    mkdir -p ${PROJECT_FOLDER_ABSPATH}
    cp -r ${SCRIPT_DIR}/dir-template/${word}/* ${SCRIPT_DIR}/dir-template/${word}/.[^.]* ${PROJECT_FOLDER_ABSPATH}/
    break
done

