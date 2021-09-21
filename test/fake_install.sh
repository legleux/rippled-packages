. /etc/os-release

if [ "$ID" = "centos" ]; then
  PKG=rpm
  ./packages/rpm/rippled
elif [ "$ID" = "ubuntu" ]; then
  PKG=dpkg
else
  echo "Unsupported OS!"
fi
apt-get install -y tree
tree packages
NAME="$PKG"_rippled
./packages/$PKG/$NAME