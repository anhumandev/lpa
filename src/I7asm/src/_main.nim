import nifasm
import strutils
import os

proc mainProc(filename: string): void=
    if fileExists(filename):
        
    else:
        echo "asmfile not exists."