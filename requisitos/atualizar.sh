#!/bin/bash

rm Ghost007.sh
rm 1.png
rm install.sh
rm README.md
rm -rf requisitos

git clone https://github.com/H7XX/Ghost007

cd Ghost007/

chmod +x install.sh

./install.sh
