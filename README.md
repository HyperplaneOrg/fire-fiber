## fire-fiber

fire-fiber) enables one to run a Linux based firefox and or viber in a container. 
While this container should work on several system flavors, fire-fiber was created 
mainly to run on MacOS using  [docker desktop](https://www.docker.com/products/docker-desktop). 
One may ask, why not just install and use the native firefox and viber applications directly? 
If you are asking this question then this is probably of little use to you.   

### Steps to build the image

1. `git clone git@github.com:HyperplaneOrg/fire-fiber.git`
2. docker build -t fire-fiber . 

### Steps to enable you to run fire-fiber on MacOS (tested with Catalinia, 10.15.X)

1. Install [docker desktop](https://www.docker.com/products/docker-desktop)  if you have not done so. 
2. Install and run the latest [XQuartz X11](https://www.xquartz.org/) server.
3. Open an xterm, then find your way to "Allow connections from network clients" in the preferences --> security tab.
4. Restart XQuarts so the new config takes...
5. Allow access from localhost
`$ xhost + 127.0.0.1` 
6. Start the docker container, using the internal docker display:
`docker run -e DISPLAY=host.docker.internal:0 fire-viber`

### Trouble shooting
