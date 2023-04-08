#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
PROJECT_FOLDER_NAME=$1

TYPES=$(ls $SCRIPT_DIR/dir-template)

# 標準入力で リポジトリ名 を入力させて PROJECT_FOLDER_NAME に代入する
read -p "Enter the project name: " PROJECT_FOLDER_NAME

select word in $TYPES
do
    EXEC_DIR=$(pwd)
    PROJECT_FOLDER_ABSPATH="${EXEC_DIR}/${PROJECT_FOLDER_NAME}" # 実行ディレクトリ以下に作る
    echo "Clone ${word} template as ${PROJECT_FOLDER_ABSPATH}"

    mkdir -p ${PROJECT_FOLDER_ABSPATH}
    cp -r ${SCRIPT_DIR}/dir-template/${word}/* ${SCRIPT_DIR}/dir-template/${word}/.[^.]* ${PROJECT_FOLDER_ABSPATH}/
    break
done

# 標準入力で yかNを入力すると、yなら code コマンドで ${PROJECT_FOLDER_ABSPATH}/ を開く
read -p "Open ${PROJECT_FOLDER_ABSPATH} with VSCode? [y/N] " yn
case "$yn" in [yY]*) code ${PROJECT_FOLDER_ABSPATH} ;; *) echo "Finished." ;; esac

