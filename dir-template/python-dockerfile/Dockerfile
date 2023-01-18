# created By jaappao

# https://github.com/microsoft/vscode-dev-containers/tree/main/containers/python-3
# FROM mcr.microsoft.com/vscode/devcontainers/python:3

# https://github.com/devcontainers/images/tree/main/src/python
FROM mcr.microsoft.com/devcontainers/python:3

RUN adduser dev-user && chown -R dev-user /home/dev-user
USER dev-user

RUN mkdir -p /home/dev-user/workspace
WORKDIR /home/dev-user/

# Python Settings
ADD requirements.txt /home/dev-user/
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

# OS Settings
# RUN apt-get update && apt-get upgrade # OS upgrade