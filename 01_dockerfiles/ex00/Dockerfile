# From an alpine image you’ll add to your container 
# your favorite text editor, vim or emacs, that will launch 
# along with your container.

# build:
# `docker build - < Dockerfile`

# launch:
# `docker run -it --rm <image id>`

FROM alpine

RUN apk update
RUN apk add \
  vim

CMD ["vim"]
