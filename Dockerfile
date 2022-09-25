FROM cm2network/steamcmd:latest
LABEL maintainer "Quinn Henry - quibtech.com"

# Default to bash
SHELL ["/bin/bash"]

# Install the Unturned server
RUN ["./steamcmd.sh", "+quit"]
RUN ["./steamcmd.sh", "+login anonymous", "+app_update 1110390", "+quit"]

WORKDIR /home/steam/Steam/steamapps/common/U3DS

# Create the server directory
RUN ["mkdir", "-p", "/home/steam/Steam/steamapps/common/U3DS/Servers/unturned-server/Server"]
# Copy configuration files
COPY /bin/Config.json Servers/unturned-server/
COPY /bin/Server/* Servers/unturned-server/Server

# Expose the necessary port
EXPOSE 27015

# Run the server
CMD ["./ServerHelper.sh", "+InternetServer/unturned-server"]