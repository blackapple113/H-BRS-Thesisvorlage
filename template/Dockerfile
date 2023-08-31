FROM alpine:latest
WORKDIR /tmp

# update and install packages
RUN apk --no-cache add \
    # texlive-full for full compatibility
    texlive-full \
    # biber for bibtex
    biber \
    # python3 and pygments for code highlighting
    python3 \
    py3-pygments \
    # inkscape for svg graphics
    inkscape \
    # windows fonts to use with drawio svg graphics
    msttcorefonts-installer \
    fontconfig && \
    update-ms-fonts && \
    fc-cache -f

# create normal user for latex compilation
RUN adduser -D latex
USER root

# start compilation process
ENTRYPOINT [ "./build-latex.sh" ]