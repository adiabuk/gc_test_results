#!/usr/bin/env python

import sys
from collections import defaultdict
import numpy as np
results = {}

dirs = ["2ma_4h_no-stop", "2ma_4h_no-stop_new", "2ma_4h_stop-loss", "4ma_4h_no-stop",
        "4ma_4h_no-stop_new", "4ma_4h_stop-loss", "5ma_4h_no-stop", "5ma_4h_no-stop_new"]

years = ("2018", "2019")

for year in years:
    results[year] = defaultdict(dict)

for dir in dirs:
    for year in years:

        file = "{}_percs.txt".format(year)
        path = "{0}/{1}".format(dir, file)
        with open(path, 'r') as f:
            for row in f:
                data = row.split()
                try:
                    results[year][dir][data[0]] = data[1]
                except IndexError:
                    pass
pairs = results[max(years)][min(dirs)].keys()
for pair in pairs:
    for dir in dirs:
        local_result = []
        for year in years:
            try:
                local_result.append(float(results[year][dir][pair]))
            except KeyError:
                pass
        A_1 = np.array(local_result)
        qualify = bool(((A_1 >= 50).sum() == A_1.size).astype(np.int) and local_result) and len(local_result) > 1
        if qualify:
            print(*local_result, sep=' ', end=' ')
            print(dir, pair)
        else:
            print(*local_result, sep=' ', end='')
            print(dir, pair, "skip")
