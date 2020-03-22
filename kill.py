import os
import sys

for i in range(1, len(sys.argv)):
    command = "taskkill /f /im  " + sys.argv[i] + " /t"
    os.system(command)