FROM cm2network/steamcmd:latest
LABEL maintainer "Quinn Henry - quibtech.com"

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


EXPOSE 27015
#ENTRYPOINT ["/home/steam/Steam/steamapps/common/U3DS/ServerHelper.sh", "+InternetServer/unturned-server"]