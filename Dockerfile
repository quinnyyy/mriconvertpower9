# Docker file for mriconvertpower9 ChRIS plugin app
#
# Build with
#
#   docker build -t <name> .
#
# For example if building a local version, you could do:
#
#   docker build -t local/pl-mriconvertpower9 .
#
# In the case of a proxy (located at 192.168.13.14:3128), do:
#
#    docker build --build-arg http_proxy=http://192.168.13.14:3128 --build-arg UID=$UID -t local/pl-mriconvertpower9 .
#
# To run an interactive shell inside this container, do:
#
#   docker run -ti --entrypoint /bin/bash local/pl-mriconvertpower9
#
# To pass an env var HOST_IP to container, do:
#
#   docker run -ti -e HOST_IP=$(ip route | grep -v docker | awk '{if(NF==11) print $9}') --entrypoint /bin/bash local/pl-mriconvertpower9
#



FROM docker.io/quinnyyy/test123:test2
MAINTAINER fnndsc "dev@babymri.org"

ENV FREESURFER_HOME="/freesurferhome"
ENV APPROOT="/usr/src/mriconvertpower9"
COPY ["mriconvertpower9", "${APPROOT}"]
COPY ["requirements.txt", "${APPROOT}"]

WORKDIR $APPROOT

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt -t .

#CMD ["./mriconvertpower9.py", " ./output"]
CMD ["./mriconvertpower9.py", "--exec", "/usr/bin/mri_convert", "--inputFile", "0001-1.3.12.2.1107.5.2.19.45152.2013030808110258929186035.dcm", "--outputFile", "image.nii", "--inputdir", "input", "output"]
#CMD ["ls"]
#CMD ["./mriconvertpower9.py", "--help"]
