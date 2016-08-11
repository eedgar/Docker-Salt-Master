#
# Salt Stack Salt Master Container
#

FROM ubuntu:16.04
MAINTAINER rocket <rocketman110@gmail.com>

# Update System
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold && apt-get install -y curl
RUN curl -L https://bootstrap.saltstack.com -o install_salt.sh
RUN sh install_salt.sh -P -M -X
RUN rm install_salt.sh

# Add PPA

#RUN apt-get install -y python-software-properties software-properties-common dmidecode
#RUN add-apt-repository -y ppa:saltstack/salt-staging
#RUN apt-get update

# Install Salt

#RUN apt-get install -y salt-master salt-api salt-cloud

# Volumes

VOLUME ['/etc/salt/pki', '/var/cache/salt', '/var/logs/salt', '/etc/salt/master.d', '/srv/salt']

# Add Run File

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Ports

EXPOSE 4505 4506

# Run Command

CMD "/usr/local/bin/run.sh"
