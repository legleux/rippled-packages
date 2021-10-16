. /etc/os-release

if [ "$ID" = "centos" ]; then
  PKG=rpm
elif [ "$ID" = "ubuntu" ]; then
  PKG=dpkg
else
  echo "Unsupported OS!"
fi

NAME=rippled
./packages/$PKG/$NAME