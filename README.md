# Apache 2.4 Connector for Crowd and RHEL 7

This repository is a clone of the Crowd Apache/Subversion connector hosted on [Atlassian Labs](https://bitbucket.org/atlassianlabs/cwdapache.git) which is no longer supported by Atlassian as of 31 December 2014.

It does *additionally* contain:
- Changes to support Apache HTTPD 2.4 (see Background Information below)
- Slight adjustments in the `configure.ac` file for building on RHEL 7
- Two additional Docker files to build the connector for RHEL 7.4 (should also work for all 7.x versions).
 
The changes of the original connector are reflected in Commit 88a6908614a3c7da46c50531b05e497314d06a43 .

The Original documentation of the forked repository can be found in [README-original.md](README-original.md).

## Background Information
The main purpose of this repository is to build the Crowd Apache/Subversion connector on RHEL 7.4 which ships with Apache HTTPD 2.4. The original version of the connector was written for Apche HTTPD 2.2.

The original repository contains a [Pull Request](https://bitbucket.org/atlassianlabs/cwdapache/pull-requests/18/added-apache-24-compatibility-and-fixed/diff) that adds support for Apache HTTPD 2.4. However, since Atlassian has stopped supportin the connector, the PR was never merged. In the meantime, the repository containing the code changes was deleted and the changes were lost.

Fortunately, there is another fork of the original repository on [GitHub](https://github.com/fgimian/cwdapache.git) which contains the code changes of the PR above and some other changes.

Since it was not possible to build @fgimian's connector with the additional adjustments on RHEL7, this repository came to live.

## How to Build/Install
To build and install the connector, you need Subversion, Apache HTTPD and some additional tools installed.
Subversion for CentOS/RHEL can be obtained from http://opensource.wandisco.com/rhel/ .

### Build/Install on RHEL 7

First, install the necessary tools to build the connector. The list varies depending on your specific RHEL installation. It might be necessary to install more tools than listed below.

    yum-config-manager --enable rhel-7-server-devtools-rpms; \
    # Subversion binaries
    yum-config-manager --add-repo http://opensource.wandisco.com/rhel/7/svn-1.8/RPMS/x86_64/; \
    yum --nogpgcheck -y install \
      git \
      file \
      autoconf \
      automake \
      make \
      curl \
      curl-devel \
      httpd \
      httpd-devel \
      mod_dav_svn \
      libtool \
      libxml2 \
      libxml2-devel \
      subversion \
      subversion-devel

The steps to build and install the connector on a running RHEL 7 are more or less similar to the steps for CentOS in README-original.md](README-original.md):

    libtoolize
    autoreconf --install
    ./configure
    make

To install the connector, run:

    make install


