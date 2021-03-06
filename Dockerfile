FROM registry.ng.bluemix.net/ibmnode:latest

RUN useradd -ms /bin/bash strong-arc \
    && chown -R strong-arc:strong-arc /usr/local \
    && su strong-arc -c "npm install -g strong-arc && npm cache clear"

# Set up some semblance of an environment
WORKDIR /home/strong-arc
ENV HOME=/home/strong-arc PORT=3000

# Run as non-privileged user inside container
USER strong-arc

# Expose strong-arc port
EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/strong-arc"]