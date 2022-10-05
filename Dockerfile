FROM debian

RUN apt update && apt upgrade -y && apt install -y python3 inkscape imagemagick make curl

COPY . /app

WORKDIR /app

RUN mkdir -p /usr/share/fonts/montserrat/
RUN install -m644 Montserrat-SemiBold.ttf /usr/share/fonts/montserrat/

CMD ["make"]