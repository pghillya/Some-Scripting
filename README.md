# Some-Scripting

Brief introduction about this repo: I know what you're thinking-- this may seem like more of a solution in search of a problem, and with an overly complex approach at that... 

I have compiled a report that, to be honest, I don't care TOO much about, but I did this mainly to showcase some of my technical ability

ToDo: add some charts and data for different date ranges (5-day, 10-day, etc...)
When requirements.txt (or any other files) get updated, trigger rebuild of the container, push to hub, then pull down to server (CI/CD)

Because of the time it takes the MTA (sendmail) to start, it wouldn't scale well if it needed to send multiple times per day, and would make more sense just to leave docker out
of it since docker isn't entirely necessary-- I execute the script in
a docker container almost just for the heck of it...

I intend to build upon this report to make it more robust and meaningful, but for now, it's main purpose is to demonstrate some basic technical skills of mine :)


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

# SIMPLEST way to use this

1) Clone the repo
2) cd to the proj dir
3) Windows: run `py script.py`

Linux: run `python3 script.py`
4) See the .xlsx created in the same directory
# Pre-reqs
Docker
