# Packages for rippled
Packaged: [61a2a5cc7dd06f3abfa6c6556101338bab298b3d](https://github.com/legleux/rippled)

![DEB Packages](https://github.com/legleux/rippled-packages/actions/workflows/deb.yml/badge.svg)
![RPM Packages](https://github.com/legleux/rippled-packages/actions/workflows/rpm.yml/badge.svg)

Code was removed from [rippled](https://github.com/ripple/rippled.git) to build deb and rpm packages.

### Todo:
- [x] Make `<pkg>-builder` images available outside artifactory **OR**
- [ ] Authenticate GHA with artifactory
- [ ] Update those images to speed packaging up
- [x] Make this run on GHA when commits pushed to src repo