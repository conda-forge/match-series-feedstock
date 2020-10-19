mkdir %build% && cd %build%

cmake -G"NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
      -DCMAKE_CXX_FLAGS=%CXXFLAGS% ^
      -DCMAKE_C_FLAGS=%CFLAGS% ^
      -DGCC_SYSTEM_TYPE="" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DUSE_PNG=1 ^
      -DPARSE_GCC_ERRORS=0 ^
      -DUSE_OPENMP=0 ^
      -DDYNAMIC_LINKING=0 ^
      -DUSE_PROFILING=0 ^
      -DUSE_SSE=0 ^
      -DUSE_BLAS=0 ^
      -DUSE_LAPACK=0 ^
      -DUSE_DOXYGEN=0 ^
      -DUSE_QT=0 ^
      -DUSE_CUDA=0 ^
      -DUSE_OPENMESH=0 ^
      -DUSE_VTK=0 ^
      -DUSE_SUITESPARSE=0 ^
      -DUSE_FOX=0 ^
      -DBUILD_FOX=0 ^
      -DUSE_FFTW=1 ^
      -DBUILD_ZLIB_AND_LIBPNG=0 ^
      -DUSE_BOOST=0 ^
      -DUSE_C++11=0 ^
      -DGENERATE_INCLUDE_TEST=0 ^
      -DUSE_TIFF=1 ^
      -DUSE_CIMG=0 ^
      -DTEST_OPENSOURCE_SELECTION=0 ^
      -DUSE_OPENGL=0 ^
      -DUSE_METIS=0 ^
      %SRC_DIR%\quocmesh
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

copy %PREFIX%\bin\tools\image\converter\convertTIFFToQuoc.exe %PREFIX%\Library\bin
copy %PREFIX%\bin\tools\image\converter\convertDM3ToQuoc.exe %PREFIX%\Library\bin
copy %PREFIX%\bin\tools\image\converter\convertSERToQuoc.exe %PREFIX%\Library\bin
copy %PREFIX%\bin\tools\image\converter\convert2DPGMTo8Bit.exe %PREFIX%\Library\bin
copy %PREFIX%\bin\tools\image\converter\convertQuocToTIFF.exe %PREFIX%\Library\bin
copy %PREFIX%\bin\tools\image\manipulator\multShiftImg.exe %PREFIX%\Library\bin
copy %PREFIX%\bin\tools\image\manipulator\deformQuoc2D.exe %PREFIX%\Library\bin
copy %PREFIX%\bin\tools\image\manipulator\swapCoordinates.exe %PREFIX%\Library\bin
copy %PREFIX%\bin\projects\electronMicroscopy\matchSeries.exe %PREFIX%\Library\bin
copy %PREFIX%\bin\projects\electronMicroscopy\matchSeismicSeries.exe %PREFIX%\Library\bin

rmdir /s/q %PREFIX%\bin\tools
rmdir /s/q %PREFIX%\bin\projects
rmdir /s/q %PREFIX%\bin\selfTest
