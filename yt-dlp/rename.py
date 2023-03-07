'''

Usage:

./rename.py

A simple python script for renaming files

'''


import os, re, shutil

mypath = '.'
files = [f for f in os.listdir(mypath) if os.path.isfile(os.path.join(mypath, f))]

for file in files:
    match = re.findall('[0-9]+\s-\s(The Legend of Zelda.*)', file)
    if match:
        shutil.copyfile(file,match[0])