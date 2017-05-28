FROM alpine
MAINTAINER Andrew Nagle <kabili@zyrenth.com>

ENV APP_DIR /app
ENV FLASK_APP app.py

COPY app.ini /app.ini
COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache uwsgi uwsgi-python py2-pip mariadb-dev gcc musl-dev python2-dev \
    && pip install --upgrade pip \
    && pip install flask \
    && addgroup uswgi \
    && adduser -D -h /var/lib/uswgi -s /sbin/nologin -G uswgi uswgi \
    && mkdir ${APP_DIR} \
    && chmod 755 /entrypoint.sh \
    && rm -rf /.wh /root/.cache /var/cache

VOLUME ${APP_DIR}
EXPOSE 5000

WORKDIR ${APP_DIR}


#CMD ["/usr/bin/flask", "run", "--reload", "-h", " 0.0.0.0"]
#CMD ["/usr/sbin/uwsgi", "--ini", "/app.ini"]

ENTRYPOINT ["/entrypoint.sh"]
