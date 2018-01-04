# Apache Connector for Crowd
This is the source code for the Crowd Apache/Subversion connector. The connector is no longer supported by Atlassian as of 31 December 2014.

# Building

The following instructions assume your current working directory is the directory where cwdapache is checked out, and that [Git](http://git-scm.com/) is available on the build machine (it's used during the build):

     git clone https://bitbucket.org/atlassian/cwdapache.git 
     cd cwdapache

## Building on CentOS 6

Last tested on CentOS 6.5:

    yum install autoconf automake curl-devel httpd-devel libtool libxml2-devel subversion-devel curl httpd-devel libtool libxml2 mod_dav_svn
    libtoolize
    autoreconf --install
    ./configure
    make

### Optional: How to Build an RPM

If you'd like to build an RPM for later installation:

    yum install rpm-build
    echo "%_topdir $HOME/rpmbuild" > ~/.rpmmacros
    mkdir -p ~/rpmbuild/{SOURCES,BUILD,SRPMS,RPMS}
    rm mod_authnz_crowd-*.tar.gz
    make dist # builds source distribution which is used as the source for the RPM
    cp mod_authnz_crowd-*.tar.gz ~/rpmbuild/SOURCES
    sed "s/Version:        .*/Version:        $(./version-gen)/" packages/mod_authnz_crowd.spec > packages/mod_authnz_crowd-current.spec
    rpmbuild -ba --target x86_64 packages/mod_authnz_crowd-current.spec # or '--target x86' for a 32 bit build
    rm packages/mod_authnz_crowd-current.spec
    echo "Your RPMS should be in..." && ls -R ~/rpmbuild/SRPMS ~/rpmbuild/RPMS

## Building on CentOS 5

Last tested on CentOS 5.10.

Follow the instructions for CentOS 6, but:

- you must use a more recent version of [libtool](http://www.gnu.org/software/libtool/libtool.html). [libtool 2.2.6b](http://mirror.aarnet.edu.au/pub/gnu/libtool/libtool-2.2.6b.tar.gz) is what CentOS 6 ships with at time of writing, and is known to work.

## Building on Debian 6 (squeeze):

    aclocal
    libtoolize
    automake --force-missing --add-missing
    autoreconf
    ./configure
    make

# Installing

    make install

# After installing

Modify apache config, do NOT USE .htaccess!

    service apache2 reload
