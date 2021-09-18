#!/usr/bin/python3
import psycopg2
import random
import math
import os
import subprocess

os.fork()

while True:
    cmd = "wget -e use_proxy=yes -e http_proxy=127.0.0.1:80 127.0.0.1:8080/20G.bin"
    process = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
