FROM arm32v7/python:3.6.1

RUN pip install buildbot-worker

RUN echo "deb http://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt update && apt install -y openjdk-7-jre
RUN apt install -y sbt

RUN curl -fsSL get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN groupmod -g 996 docker

RUN pip install docker-compose

COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

RUN useradd -m -G docker buildbot
WORKDIR /buildbot
COPY start_worker.sh /buildbot/

RUN chown -R buildbot:buildbot /buildbot

USER buildbot

CMD ["sh", "/buildbot/start_worker.sh"]
