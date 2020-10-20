#!/bin/bash
cmake -G"Unix Makefiles" \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_CXX_FLAGS=${CXXFLAGS} \
      -DCMAKE_C_FLAGS=${CFLAGS} \
      -DGCC_SYSTEM_TYPE="" \
      -DCMAKE_BUILD_TYPE=Release \
      -DUSE_PNG=1 \
      -DPARSE_GCC_ERRORS=0 \
      -DUSE_OPENMP=0 \
      -DDYNAMIC_LINKING=1 \
      -DUSE_PROFILING=0 \
      -DUSE_SSE=1 \
      -DUSE_BLAS=1 \
      -DUSE_LAPACK=1 \
      -DUSE_DOXYGEN=0 \
      -DUSE_QT=0 \
      -DUSE_CUDA=0 \
      -DUSE_OPENMESH=0 \
      -DUSE_VTK=0 \
      -DUSE_SUITESPARSE=1 \
      -DUSE_FOX=0 \
      -DBUILD_FOX=0 \
      -DUSE_FFTW=1 \
      -DUSE_GRAPE=0 \
      -DUSE_C++11=1 \
      -DGENERATE_INCLUDE_TEST=0 \
      -DUSE_TIFF=1 \
      -DUSE_CIMG=0 \
      -DTEST_OPENSOURCE_SELECTION=0 \
      -DUSE_OPENGL=0 \
      -DUSE_METIS=0 \
      quocmesh
make -j${CPU_COUNT}
make test
make install

mv ${PREFIX}/bin/tools/image/converter/convertTIFFToQuoc ${PREFIX}/bin
mv ${PREFIX}/bin/tools/image/converter/convertDM3ToQuoc ${PREFIX}/bin
mv ${PREFIX}/bin/tools/image/converter/convertSERToQuoc ${PREFIX}/bin
mv ${PREFIX}/bin/tools/image/converter/convert2DPGMTo8Bit ${PREFIX}/bin
mv ${PREFIX}/bin/tools/image/converter/convertQuocToTIFF ${PREFIX}/bin
mv ${PREFIX}/bin/tools/image/manipulator/multShiftImg ${PREFIX}/bin
mv ${PREFIX}/bin/tools/image/manipulator/deformQuoc2D ${PREFIX}/bin
mv ${PREFIX}/bin/tools/image/manipulator/swapCoordinates ${PREFIX}/bin
mv ${PREFIX}/bin/projects/electronMicroscopy/matchSeries ${PREFIX}/bin
mv ${PREFIX}/bin/projects/electronMicroscopy/matchSeismicSeries ${PREFIX}/bin

rm -rf ${PREFIX}/bin/tools
rm -rf ${PREFIX}/bin/projects
rm -rf ${PREFIX}/bin/selfTest
