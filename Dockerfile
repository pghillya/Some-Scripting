FROM alpine:latest AS builder

########################
# Builder stage         #
# Most of the hard work #
########################
WORKDIR /app
RUN apk update && apk add python3 py3-pip ssmtp dos2unix
COPY ./requirements.txt /app/requirements.txt

# Mail stuff #
RUN rm /etc/ssmtp/ssmtp.conf
COPY ./ssmtp.conf /etc/ssmtp/ssmtp.conf
# For testing locally-- Git can easily handle my line endings on commit :)
RUN dos2unix /etc/ssmtp/ssmtp.conf

# Finish building by installing deps
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

########################
# Initialize final stage #
########################
FROM builder AS final
WORKDIR /app
COPY . /app
# Because I'm developing in a Win machine :( 
RUN dos2unix /app/*

CMD [ "sh", "./start.sh" ]