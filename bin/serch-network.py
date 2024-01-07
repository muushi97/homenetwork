#!/usr/bin/env python3

import glob
import yaml

for path in glob.glob("**/compose.yaml", recursive=True):
    with open(path) as f:
        xs = yaml.load(f, Loader=yaml.FullLoader)
    if "services" in xs:
        for k, ys in xs["services"].items():
            if "networks" in ys:
                for network_name, network_conf in ys["networks"].items():
                    if network_conf is not None and "ipv4_address" in network_conf:
                        print(f'{path}:: ' + f'"{k}"' + " has network " + f'"{network_name}", ip address is "{network_conf["ipv4_address"]}".')
                    else:
                        print(f'{path}:: ' + f'"{k}"' + " has network " + f'"{network_name}", ip address is dynamic.')
            else:
                print(f'{path}:: ' + f'"{k}"' + " has not network.")

