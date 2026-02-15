#!/bin/bash
#set -e
sed -i '/^_apt:/d' /etc/passwd  # See https://github.com/containers/bubblewrap/issues/210

apt update
apt install -y dialog  # apt needs this to show stuff, so let's install it first

# These two files are chown'd by dpkg during installation, and chown is not supported within bubblewrap. Fortunately we don't care about these files so let's just skip them.
# See also: https://github.com/containers/bubblewrap/issues/395
apt upgrade -y -o Dpkg::Options::="--path-exclude=/usr/sbin/pam_extrausers_chkpwd" -o Dpkg::Options::="--path-exclude=/usr/sbin/unix_chkpwd"

sed -i '/^_apt:/d' /etc/passwd

apt install -y build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libtinfo6 locales zlib1g-dev gawk

PATH="$PATH:/usr/sbin" dpkg-reconfigure locales
