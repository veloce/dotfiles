#!/bin/bash

# scan scala / java lib sources and build tags file
# the script assumes sources are already downloaded and present in cache dir
# use "sbt update-classifiers" or "mvn dependency:sources" to download sources

usage() {
    echo "Usage: `basename $0` -l LANG"
    echo "Extract java/scala sources and generate ctags."
    echo
    echo "OPTIONS:"
    echo "-l Language: either java or scala"
    exit 1
}

lang=
libs_dir=
target_dir=
copy_cmd=
while getopts l: opt
do
    case $opt in
        l) lang="$OPTARG";;
        ?) usage;;
    esac
done

case $lang in
    scala) 
        libs_dir=$HOME/.ivy2
        target_dir=$HOME/.scala-srcs
        copy_cmd="find . -type d -name srcs -exec cp -r --parents {} $target_dir/ \;"
        ;;
    java) 
        libs_dir=$HOME/.m2
        target_dir=$HOME/.java-srcs
        copy_cmd="find . -type f -name *sources.jar -exec cp --parents {} $target_dir/ \;"
        ;;
    *) usage
        ;;
esac

# create target if it does not exist
if [ ! -d "$target_dir" ]; then
    mkdir $target_dir
fi

# clear target dir
if [ -d "$target_dir"]; then
    rm -r $target_dir/*
fi

# copy sources to target dir
cd $libs_dir
eval $copy_cmd

# unzip jars
cd $target_dir
for jar in `find . -type f -name *.jar -print0 | xargs -0`; do
    unzip $jar -d `dirname $jar`
done

# generate ctags
cd $target_dir
ctags
