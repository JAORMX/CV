FROM docker.io/fedora:latest

RUN dnf install -y \
    texlive \
    texlive-palatino \
    texlive-simple-resume-cv \
    texlive-cm \
    texlive-url \
    texlive-currvita \
    texlive-collection-latexextra \
    && dnf clean all
