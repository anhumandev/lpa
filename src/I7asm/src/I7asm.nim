import os

let args = commandLineParams()

proc helpmenu(): void=
  echo "I7ASM 0.0.1-alpha"
  echo "This is the last version to feature a separate executable file; from this point on, I7 will be integrated with the P/ interpreter."
  echo "\n\t"
  echo "usage: ./i7asm --[option] [filename].s"
  echo "options:"
  echo "\t--import: get ASM code from file."
  echo "\t--version: Version of this standalone binery file."
  echo "https://github.com/pouya1dev/lpa/tree/main/i7asm"
 
if args.len == 0:
  helpmenu()
else if args[0] == "--import":
  