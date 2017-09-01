[![](https://travis-ci.org/mbodenhamer/docker-texlive.svg?branch=master)](https://travis-ci.org/mbodenhamer/docker-texlive)

TeX Live in Docker.

The `2017` version of `texlive-full`, installed using the texlive binary installer. Ghostscript is also installed.

Map the current directory (or the directory containing the `.tex` source files) to `/app`, and run any command. For example:

    $ docker run --rm -it -v $(pwd):/app mbodenhamer/texlive pdflatex report.tex

By default, the container will run `chown` to reset ownership of all files under `/app` to `1000:1000` prior to exiting. To change these settings, modify the `BE_UID` and `BE_GID` environment variables as needed. For example, to reset ownership to `1001:1002`, invoke like so:

    $ docker run --rm -it -v $(pwd):/app -e BE_UID=1001 -e BE_GID=1002 \
	    mbodenhamer/texlive pdflatex report.tex
