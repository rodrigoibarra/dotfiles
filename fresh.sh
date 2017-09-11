#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"

sh "${BASEDIR}"/install/install.sh

echo "install done"

echo "now configuration"

sh "${BASEDIR}"/MacOS/defaults.sh

echo "listo"
