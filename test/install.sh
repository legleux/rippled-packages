. /etc/release
if [ "$ID" = "centos" ]; then
  . ./packages/rpm/build_vars
  yum install ./packages/rpm/$rpm_version_release.x86_64.rpm
elif [ "$ID" = "ubuntu" ]; then
  . ./packages/dpkg/build_vars
  apt install ./packages/dpkg/rippled_"$dpkg_full_version"_amd64.deb
else
  echo "Unsupported OS!"
fi
which rippled
rippled --unittest