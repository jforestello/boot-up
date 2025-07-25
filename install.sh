#!/bin/bash

# Exit on error
set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jforestello/boot-up/main/brew.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jforestello/boot-up/main/git.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jforestello/boot-up/main/gen_ssh.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jforestello/boot-up/main/upload_github.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jforestello/boot-up/main/setup_installer.sh)"
