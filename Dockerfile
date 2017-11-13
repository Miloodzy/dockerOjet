FROM centos/systemd

USER root

#ADD ionic.sh /root

RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - 
RUN yum -y install nodejs git 
RUN npm version 
RUN npm install -g cordova 
RUN npm -g install @oracle/ojet-cli   
WORKDIR /project
RUN mkdir /project ; cd /project ; ojet create amproject --template=navdrawer; echo n
ADD ionic.sh /
#RUN ./ionic.sh


#RUN cd /project/amproject ; ojet serve & 
#RUN /ionic.sh

EXPOSE 8000
CMD cd amproject && ojet serve

VOLUME ["/project/amproject"] 
