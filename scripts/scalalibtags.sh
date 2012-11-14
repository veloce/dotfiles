#!/bin/bash

# scan scala lib sources and build tag file
# the script assumes sources are already downloaded and present in cache dir
# use sbt update-classifiers to download sources

SOURCES_DIR=$HOME/.scala-srcs

if [ -n "$1" ]; then
    LIBS_DIR=$1
else
    LIBS_DIR=$HOME/.ivy2
fi

if [ ! -d "$SOURCES_DIR" ]; then
    mkdir $SOURCES_DIR
fi

# clear sources dir
rm -r $SOURCES_DIR/*

# copy jars to sources dir
cd $LIBS_DIR
find . -type d -name srcs -exec cp -r --parents {} $SOURCES_DIR/ \;

# unzip jars
cd $SOURCES_DIR
for jar in `find . -type f -name *.jar -print0 | xargs -0`; do
    unzip $jar -d `dirname $jar`
done

# generate ctags
cd $SOURCES_DIR
ctags
