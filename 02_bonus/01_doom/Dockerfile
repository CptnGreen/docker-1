# build:
# `docker build - < Dockerfile`

# launch:
# `docker run -it --rm <image id>`

FROM alpine

RUN apk update
RUN apk add \
  emacs \
  git \
  ripgrep \
  fd
RUN git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
RUN ~/.emacs.d/bin/doom -y install

CMD emacs
