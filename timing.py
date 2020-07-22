"""Summary
This package is for timing Python scripts.
Usage:
    basic usage: import timing

    advanced usage: 1. To time: put timing.go() and timing.end('something that you wanna say') before and after the command block
                    2. To log: use timming.log('something that you wanna say')

Attributes:
    start (TYPE): Description
"""
import atexit
from time import time, strftime, localtime, gmtime, mktime
from datetime import timedelta

def secondsToStr(elapsed=None):

    if elapsed is None:
        return strftime("%Y-%m-%d %H:%M:%S", localtime())
    else:
        return str(timedelta(seconds=elapsed))

def log(s, elapsed=None):
    line = "="*40
    print(line)
    print(secondsToStr(), '-', s)
    if elapsed:
        print("Elapsed time:", elapsed)
    print(line)
    print()

def endlog():
    end = time()
    elapsed = end - start
    log("End Program", secondsToStr(elapsed))

start = time()
atexit.register(endlog)
log("Start Program")



_start = None
_end = None

def log_subtask(s, elapsed=None):
    line = "="*40
    print(line)
    print(strftime("%Y-%m-%d %H:%M:%S", _start), '-', strftime("%Y-%m-%d %H:%M:%S", _end), '-', s)
    if elapsed:
        print("Elapsed time:", elapsed)
    print(line)
    print()


def go():
    global _start
    _start = localtime()

def end(s):
    global _end
    _end = localtime()
    _elapsed = mktime(_end) - mktime(_start)
    log_subtask(s, secondsToStr(_elapsed))




