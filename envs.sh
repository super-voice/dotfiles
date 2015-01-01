#!/usr/bin/env bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
#TOOLCHAIN_DIR="$DEVELOPER_DIR/Toolchains/XcodeDefault.xctoolchain"
TOOLCHAIN_DIR="/Library/Developer/CommandLineTools"
LIBCXX_INCLUDE_DIR=$TOOLCHAIN_DIR/usr/include/c++/v1

while [ $# -ge 1 ]; do
  case $1 in
    "debug" )
      COMMONFLAGS="-march=native -fcolor-diagnostics -Wall -Wextra -Wno-long-long -Wno-unused-parameter"
      DEBUGFLAGS="$COMMONFLAGS -fno-omit-frame-pointer -g3 -O0"
      export CFLAGS="$DEBUGFLAGS $CFLAGS"
      export CXXFLAGS="-stdlib=libc++ $DEBUGFLAGS -Woverloaded-virtual $CXXFLAGS"
      ;;
    "extra" )
      export CPPFLAGS="-I/opt/extra/include $CPPFLAGS"
      export LDFLAGS="-L/opt/extra/lib $LDFLAGS"
      export PKG_CONFIG_PATH=/opt/extra/lib/pkgconfig:$PKG_CONFIG_PATH
      ;;
    "clang" )
      BASE_DIR=$HOME/build

      export CC=clang
      export CXX=clang++
      export PATH=$BASE_DIR/bin:$PATH
      export PKG_CONFIG_PATH=$BASE_DIR/lib/pkgconfig:$PKG_CONFIG_PATH
      export CXXFLAGS="-stdlib=libc++ -I$BASE_DIR/include -isystem $LIBCXX_INCLUDE_DIR ${CXXFLAGS}"
      export LDFLAGS="-L$BASE_DIR/lib ${LDFLAGS}"
      export DYLD_FALLBACK_LIBRARY_PATH=$BASE_DIR/lib:$BASE_DIR/lib/clang/3.5.1/lib/darwin:$DYLD_FALLBACK_LIBRARY_PATH
      unset ASAN_SYMBOLIZER_PATH
      ;;
    "clang2" )
      BASE_DIR=$HOME/build2

      export CC=clang
      export CXX=clang++
      export PATH=$BASE_DIR/bin:$PATH
      export DYLD_FALLBACK_LIBRARY_PATH=$BASE_DIR/lib:$BASE_DIR/lib/clang/3.6.0/lib/darwin:$DYLD_FALLBACK_LIBRARY_PATH
      unset ASAN_SYMBOLIZER_PATH
      ;;

    "homebrew" )
      export PATH=/usr/local/opt/openssl/bin:/usr/local/opt/curl/bin:$PATH
      export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig:/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/sqlite/lib/pkgconfig
      export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/curl/include"
      export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/curl/lib"
      export PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig:/usr/local/Library/ENV/pkgconfig/10.9
      export ACLOCAL_PATH=/usr/local/share/aclocal
      ;;
    "qt5" )
      QT_BASE=$HOME/Qt5.4/5.4/clang_64

      if [ ! -d $QT_BASE ] ; then
        echo "$QT_BASE does not exist"
        exit -1
      fi
      export PATH=$QT_BASE/bin:$PATH
      export PKG_CONFIG_PATH=$QT_BASE/lib/pkgconfig:$PKG_CONFIG_PATH
      ;;
    "rust" )
      RUST_BASE=$HOME/build-rust

      export PATH=$RUST_BASE/bin:$PATH
      export LDFLAGS="${LDFLAGS} -L$RUST_BASE/lib"
      export DYLD_FALLBACK_LIBRARY_PATH=$RUST_BASE/lib
      ;;
    "reset")
      unset CC CXX
      unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS LLVM_CONFIG
      unset DYLD_FALLBACK_LIBRARY_PATH
      ;;
    *)
      echo "unknown argument"
      exit -1
  esac
  shift
done
