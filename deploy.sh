#!/bin/bash
set -e
echo """
#####################################################
#### DEPRECATED
#### Left only for backwards-compatibility purposes
#### Use Makefile instead as

        make install
#####################################################
"""

make install
echo "Done";
