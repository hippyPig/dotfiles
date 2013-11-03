#!/usr/bin/python
import os
import sys

def backup(dotfiles):
    bkup_number = 0
    bkup_dir = 'dotfiles_bkup_%d'
    while os.path.exists(bkup_dir % bkup_number):
        bkup_number += 1
    bkup_dir = bkup_dir % bkup_number
    os.mkdir(bkup_dir)
    cmd = 'mv %s %s/.'
    for dotfile in dotfiles:
        os.system(cmd % (dotfile, bkup_dir))
    return


def install():
    dotfiles = [x for x in os.listdir('.') if x.startswith('dot.')]
    newfiles = [x.replace('dot.', '.') for x in dotfiles]
    newfiles = [os.path.join(os.getenv('HOME'), x) for x in newfiles]
    backup(newfiles)
    files = zip(dotfiles, newfiles)
    cmd = 'ln -s %s %s'
    for dotfile, newfile in files:
        os.system(cmd % (dotfile, newfile))
    return






if __name__ == "__main__":
    install()
