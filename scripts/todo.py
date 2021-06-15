#!/usr/bin/env python3

#author: elias nijs
#date    2021-06-06

# TODOSCRIPT

 # Steps
 # 1. read -> array
 # 2. get option -> act accordingly
 # 3. write


import sys

items = []
for x in open("/home/eliasnijs/scripts/.config/todo"):
    items.append(x.strip())

args = sys.argv[1:]

if len(args) <= 1:
    t = 1
    for x in items:
        print(f"{t}. {x}")
        t += 1
else:
    opt = args[0]
    item = " ".join(args[1:])
    
    assert opt == 'a' or opt == 'r', "invalid option"
    if opt == 'a':
        items.append(item)
    if opt == 'r':
        assert item.isdigit(), "invalid index"
        index = int(item)
        assert 0 <= index < len(items), "invalid index"
        items.pop(index)

    items = "\n".join(items)"
    f = open("/home/eliasnijs/scripts/.config/todo","w")
    f.write(items)
    f.close()