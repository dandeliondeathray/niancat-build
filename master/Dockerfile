FROM arm32v7/python:3.6.1

RUN pip install buildbot buildbot-www buildbot-waterfall-view buildbot-console-view

WORKDIR /var/lib/buildbot
RUN mkdir db
COPY master.cfg /var/lib/buildbot

RUN useradd -m buildbot
RUN chown -R buildbot:buildbot /var/lib/buildbot

USER buildbot

RUN buildbot create-master --db=sqlite:///db/state.sqlite

CMD ["buildbot", "start", "--nodaemon"]
