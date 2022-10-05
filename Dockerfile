FROM alpine

RUN apk add python3 inkscape imagemagick make

COPY . /app

WORKDIR /app

RUN mkdir -p /usr/share/fonts/montserrat/
RUN install -m644 Montserrat-SemiBold.ttf /usr/share/fonts/montserrat/

CMD ["make"]