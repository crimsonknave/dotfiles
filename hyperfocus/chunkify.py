#!/usr/bin/env python

import argparse
import datetime
from abc import ABC

parser = argparse.ArgumentParser(
    prog="Chunkify",
    description="Wraps another program and breaks its use into distinct chunks to help manage ADHD hyperfocus."
)

parser.add_argument("program")
parser.add_argument("program_args", type=list, default=[], nargs="*")



class Notifier(ABC):
    def __init__(self):
        self.notify_args = []

    def notify(self, message, notify_args):
        notify_args = self.notify_args
        subprocess.run([self.notify_command, notify_args])
        # return captured bits for if alternate times are selected for example.

class Swaynag(Notifier):
    def __init__(self, centering=80*" "):
        self.centering = centering
        self.notify_command = "swaynag"
        super().__init__()

    def notify(self, message, notify_args):
        message = self.centering + message
        super().notify(message, notify_args)




#  program = argparse"...

unit = "m"
kill_time = 30
save_time = 1
sleep_time = kill_time - save_time
centering = 80 * " "


save_message = centering + f"{sleep_time}{unit} have passed. You have {save_time}{unit} to save."

swaynag_settings = '-o DP-1 -y overlay --message-padding 24 --button-padding 19 -f "Monospace 24"'

def duration_message(duration):
    return (f"--button-dismiss {duration}m", f"echo '{duration}' > /tmp/game-chunk-time")

# 0-4 weekdays, 5-6 weekend
day = datetime.datetime.today().weekday()
hour = datetime.datetime.now().hour

day_types = {
    "weekday": range(4),
    "weekend": [5,6],
}

allowed_times = {
    "weekday": range(18,21),
    "weekend": range(11,21),
    # "vacation": ...
}

day_type = [key for key,value in day_types.items() if day in value][0]
allowed = hour in allowed_times[day_type]

if allowed:
    print("Allowed")
else:
    print("Not allowed")

