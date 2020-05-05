#!/usr/bin/env python
#pylint: disable=redefined-builtin
"""
Script to compare results of various strategies and display pairs suitable for trading based on
minimum consistant results across the available years
"""

import os
from collections import defaultdict
import numpy as np


def main():
    """
    Using results files (ending in _percs.txt) in given directories, sort data and find pairs in a
    single strategy where results for all years are above min_perc.  Use numpy for easily comparing
    each item in the array
    """
    results = {}

    dirs = []
    path = '.'
    directory_contents = os.listdir(path)
    for item in directory_contents:
        if os.path.isdir(item) and not item.startswith('.'):
            dirs.append(item)
    print(dirs)
    years = ("2018", "2019")
    min_perc = 0
    pairs = set()
    for year in years:
        results[year] = defaultdict(dict)

    for dir in dirs:
        for year in years:

            file = "{}_percs.txt".format(year)
            path = "{0}/{1}".format(dir, file)
            try:
                with open(path, 'r') as data:
                    for row in data:
                        data = row.split()
                        try:
                            pairs.add(data[0])
                            results[year][dir][data[0]] = data[1]
                        except IndexError:
                            pass
            except FileNotFoundError:
                pass

    for pair in pairs:
        for dir in dirs:
            local_result = []
            for year in years:
                try:
                    local_result.append(float(results[year][dir][pair]))
                except KeyError:
                    pass
            array = np.array(local_result)
            # if each item is at least min_perc and there are at least 2 items (years) of data
            qualify = bool(((array >= min_perc).sum() == array.size).astype(np.int) \
                    and local_result) and len(local_result) >= 2
            if qualify:
                # qualifying entries
                print(*local_result, sep=' ', end=' ')
                print(dir, pair)
            else:
                # skipped entries
                print(*local_result, sep=' ', end='')
                print(dir, pair, "skip")

if __name__ == '__main__':
    main()
