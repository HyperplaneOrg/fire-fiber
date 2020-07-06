## Fire-Viber

The Fire-Viber Docker file enables one to build a Linux based Firefox and viber messaging 
application Docker image. While this image should work on several system flavors, Fire-Viber 
was created mainly to run on Mac OS using [docker desktop](https://www.docker.com/products/docker-desktop). 

### Steps to build the image

1. `git clone git@github.com:HyperplaneOrg/fire-viber.git`
2. docker build -t fire-viber . 

### Steps to enable you to run Fire-Viber on Mac OS (tested with Catalinia, 10.15.X)

1. Install [docker desktop](https://www.docker.com/products/docker-desktop)  if you have not done so. 
2. Install and run the latest [XQuartz X11](https://www.xquartz.org/) server.
3. Open an xterm, then find your way to "Allow connections from network clients" in the preferences --> security tab.
4. Restart XQuarts so the new config takes...
5. Allow access from localhost
`$ xhost + 127.0.0.1` 
6. Start the docker container, using the internal docker display:
`docker run -e DISPLAY=host.docker.internal:0 fire-viber`

#### Connecting the audio stream on Mac OS (tested with Catalinia, 10.15.X)

Prerequisites - Install pulseaudio. One way to do this is the the Mac OS brew package manager, e.g.
`brew install pulseaudio`

1. Startup / Run the PulseAudio daemon on the Mac
`pulseaudio --load=module-native-protocol-tcp --exit-idle-time=-1 --daemon`

2. Make sure to set the following environment variable in the docker container, e.g.
`ENV PULSE_SERVER=docker.for.mac.localhost` See Dockerfile.

3. Run the container with the appropriate options: 
`docker run -it -e PULSE_SERVER=docker.for.mac.localhost -e DISPLAY=host.docker.internal:0  \
         -v ~/.config/pulse:/home/pulseaudio/.config/pulse --rm fire-viber`

### Trouble shooting

TBW
