FROM ubuntu:16.04

RUN apt update -y && apt install -y apt-transport-https wget \  
&& wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -  \  
&& echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list  \  
&& apt update -y && apt install -y filebeat && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*