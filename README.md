# docker-1

Jonah in the whale

## Setup

NB: Virtualbox step needs password and possibly also needs to address System Preference setting

```zsh
brew install docker docker-machine

brew cask install virtualbox

docker-machine create --driver virtualbox default

docker-machine ls # check creation

eval "$(docker-machine env default)"

docker run hello-world

docker-machine stop default
```

## Links

### Docker-machine setup on MacOS

https_medium.com/?url=https%3A%2F%2Fmedium.com%2Fcrowdbotics%2Fa-complete-one-by-one-guide-to-install-docker-on-your-mac-os-using-homebrew-e818eb4cfc3
