#! /usr/bin/python
# - * - coding: utf-8 - * -

import RPi.GPIO as GPIO                      # Import the library for working with GPIO
import sys
import traceback                        # Import the libraries for exception handling

from time import sleep                       # Import the library to work with time
from re import findall                       # Import the library for working with regular expressions
from subprocess import check_output          # Import the library for working with external processes


def get_temp():
    temp = check_output(["vcgencmd", "measure_temp"]).decode()  # Run the      temperature request
    temp = float(findall('\d+\.\d+', temp)[0])                     # Retrieve when using a regular expression, the temperature value from the string "temp = 47.8 ' C "
    return temp                              # Return the result of the


try:
    tempOn = 65                               # Cooler on temperature
    controlPin = 14                           # Pin responsible for control
    pinState = False                        # Current state of the cooler


    # === Initialization of pins ===
    GPIO.setmode(GPIO.BCM)                   # Numbering mode in BCM
    GPIO.setup(controlPin, GPIO.OUT, initial=0)  # Control pin in OUTPUT mode

    while True:                              # Infinite temperature request cycle
        temp = get_temp()                    # Get the temperature value

        if temp > tempOn:
            pinState = True          # Change the status status
        elif temp < tempOn - 5:
            pinState = False

        GPIO.output(controlPin, pinState)  # Set the control pin to a new status

        print(str(temp) + " " + str(pinState))  # Print the temperature to the
        sleep(1)                             # console  Pause - 1 second

except KeyboardInterrupt:
    print("Exit pressed Ctrl + C ")             # Exit the program by pressing Ctrl + C
except:
    print(" Other Exception ")                 # Other exceptions
    print(" --- Start Exception Data: ")
    traceback.print_exc(limit=2, file=sys.stdout)  # Details of the exception via traceback
    print("--- End Exception Data:")
finally:
    print("CleanUp")                         # We inform about
    GPIO.cleanup()                           # pin reset # Return the pins to the initial state
    print("End of program")                   # We inform about the completion of the program
