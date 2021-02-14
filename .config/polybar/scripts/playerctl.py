from sys import argv
from time import time
speed = int(argv[1])
var = argv[2]

CHARS_TO_SHOW = 20

curr = (int(time() * speed) % (len(var) + CHARS_TO_SHOW))
pos = (0, curr)
if(curr > CHARS_TO_SHOW-1):
    pos = (curr-CHARS_TO_SHOW+1, curr)
song = var[pos[0]:pos[1]]

if(curr > CHARS_TO_SHOW-1):
    song = song.ljust(CHARS_TO_SHOW)
else:
    song = song.rjust(CHARS_TO_SHOW)
print(song)
