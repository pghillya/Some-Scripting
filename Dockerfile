FROM python:3.8

# Take care of dependencies
RUN apt-get update && apt-get install -y mutt sendmail
COPY ./requirements.txt app/
RUN pip install -r app/requirements.txt

# Copy source files
COPY . /app

# Initialize final container
WORKDIR /app

CMD [ "bash", "start.sh" ]