#!/usr/bin/env python3

import sys
import yaml

data = yaml.safe_load(sys.stdin.read())

def display_set(data):
    if isinstance(data, list):
        for i, v in enumerate(data):
            for vs in display_set(v):
                yield [ str(i) ] + vs
    elif isinstance(data, dict):
        for k, v in data.items():
            for vs in display_set(v):
                yield [ str(k) ] + vs
    elif isinstance(data, str):
        if " " in data:
            yield [ f'"{data}"' ]
        else:
            yield [ data ]
    else:
        yield [ str(data) ]

for vs in display_set(data):
    print(" ".join(vs))



