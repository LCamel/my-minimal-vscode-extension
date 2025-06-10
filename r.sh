#!/bin/sh

npx @vscode/vsce package --skip-license

THE_DIR=/tmp/foo

rm -fR ${THE_DIR}

code --user-data-dir ${THE_DIR}/u --extensions-dir ${THE_DIR}/e --install-extension my-minimal-vscode-extension-0.0.1.vsix

code --user-data-dir ${THE_DIR}/u --extensions-dir ${THE_DIR}/e --install-extension ms-vscode-remote.vscode-remote-extensionpack

mkdir -p ${THE_DIR}/u/User
echo '{"workbench.colorTheme": "Default Light+"}' > ${THE_DIR}/u/User/settings.json


mkdir -p ${THE_DIR}/p/.devcontainer
cat <<END > ${THE_DIR}/p/.devcontainer/devcontainer.json
{
  "name": "Minimal Dev Container",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "runArgs": ["--rm"]
}
END

code --user-data-dir ${THE_DIR}/u --extensions-dir ${THE_DIR}/e  ${THE_DIR}/p

# run command "Developer: Toggle Developer Tools" for viewing console.log messages
