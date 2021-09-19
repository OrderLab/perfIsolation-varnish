#!/usr/bin/python3
import psycopg2
import random
import math
import os
import subprocess

os.fork()
os.fork()
os.fork()

cmd = "./bin/ab -n 1000 -c 1 -X 127.0.0.1:80 http://127.0.0.1:8080/index.html"
process = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)
output, error = process.communicate()
