#!/usr/bin/pwsh

docker run --rm -it -v ${pwd}:/workdir texlive/texlive:latest /bin/bash /workdir/build.sh
