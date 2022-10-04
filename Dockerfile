FROM debian

RUN apt update && apt upgrade -y && apt install -y python3 inkscape imagemagick make curl

COPY . /app

WORKDIR /app

CMD ["make", "all-docker"]