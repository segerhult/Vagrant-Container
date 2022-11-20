FROM ubuntu:16.04

RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
RUN apt-get update -y
RUN  apt -y install locales && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN apt-get install -y qemu-kvm libvirt-daemon-system libvirt-dev wget
#RUN apt-get install -y linux-image-$(uname -r)
RUN apt-get install -y curl net-tools jq virtualbox vagrant 
#RUN vagrant plugin install vagrant-libvirt
RUN vagrant box add --provider libvirt peru/windows-10-enterprise-x64-eval
RUN vagrant init peru/windows-10-enterprise-x64-eval
COPY startup.sh /
ENTRYPOINT ["/startup.sh"]
