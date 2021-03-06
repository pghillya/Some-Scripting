# Some-Scripting

Brief introduction about this repo: I know what you're thinking-- this may seem like more of a solution in search of a problem, and with an overly complex approach at that... 

I have compiled a report that, to be honest, is not particularly fancy. I did this mainly to demonstrate some of my technical ability.

ToDo: add some charts and data for different date ranges (5-day, 10-day, etc...)

### With this version, I've made some improvements:
- slimmer docker image
- no need to wait on an MTA (sendmail) to start, so it's faster
- this version actually works from ec2 since it doesn't require local MTA to send out on port 25 (which ec2 blocks)


# How I intended for this project to be used
1) Clone the repo to Report Server (Cloud Instance)
2) Place 'runStonksReport.sh' in /usr/bin/ dir
3) Configure cron job to execute 'runStonksReport.sh' (runStonksReport.sh will then trigger docker to rebuild the container from the latest source on github, then run the report job)

Note: part the idea with runStonksReport.sh is by removing the Docker image and container by name, then rebuilding, I don't need to worry about pruning my docker images

# A Simpler way to use this script
1) Clone the repo to your local PC
2) cd to the proj dir
3) in "start.sh", update the line 6 after "--" with your email address
3) Windows: run: `py -m venv venv`

`./venv/Scripts/Activate`

`py -m pip install -r requirements.txt`


Linux: run: `python3 -m venv venv` (or similar, depending on distro)

`source venv/bin/activate`

`python3 -m pip install -r requirements.txt`

4) `docker build -t stonks .`
5) `docker run -d --name stonks stonks`
6) Now, we can avoid rebuilding the image and container each time and just execute `docker start stonks` each time we want to launch the container, which will run until the report sends and then exit again...

# SIMPLEST way to use this

1) Clone the repo
2) cd to the proj dir
3) Windows: run `py script.py`

Linux: run `python3 script.py`
4) See the .xlsx created in the same directory

Note: This does not email the file, but if I wrote the .py script with smtplib and pointed to a working smtp relay, I could acheive that functionality fairly easily... alas, "continuous improvement is better than delayed perfection..."

# CI/CD example
I am using a docker image of jenkins with dind installed and configured, so I can execute docker commands within the jenkins container itself

For this basic CI approach, a credential "docker_hub_pass" must be set locally on the Jenkins server

# Pre-reqs
Docker

