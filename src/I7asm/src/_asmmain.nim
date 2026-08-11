import os

var buffer = initBuffer()
proc regesiterLister()
proc asmmaker(tokens: string[]): void=
    if tokens[0] == "mov":
        emitMov(buffer, )