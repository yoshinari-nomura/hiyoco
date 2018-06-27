#!/bin/sh
SH_PATH=$(dirname $0)

echo "Python library will be installed. Are you OK? [Y/n]"
read ANSWER

# install library
case $ANSWER in
	"" | "Y" | "y" | "Yes" | "yes" | "YES" ) pip install -r $SH_PATH/requirements/development.txt ;;
	* ) exit 0 ;;
esac

# compile .proto file
echo "Start compile .proto file"
bash $SH_PATH/compile_proto.sh
echo "Done"
