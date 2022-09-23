FROM python:3-alpine as build-base

RUN apk add --update --no-cache build-base linux-headers

RUN pip install --user --upgrade "rpi.gpio>=0.7.0" && \
    pip install --user --ignore-installed psutil && \
    pip install --user fanshim

FROM python:3-alpine

COPY --from=build-base /root/.local /root/.local

WORKDIR /usr/src/app

# Install fanshim service
COPY control.py  .
COPY entry.sh .

ENV PATH=/root/.local/bin:$PATH

CMD [ "./entry.sh" ]
