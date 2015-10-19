#!/usr/bin/python
import os
import sys
import shutil
import time


class Installer(object):
    def __init__(self):
        self._home = os.getenv('HOME')
        self._cwd = os.getcwd()
        bkup_dir = os.path.join(self._cwd, 'dotfiles_bkup_{}')
        bkup_number = 0
        while os.path.exists(bkup_dir.format(bkup_number)):
            bkup_number += 1
        self._bkupdir = bkup_dir.format(bkup_number)
        os.mkdir(self._bkupdir)

    def backup(self, fname):
        src = os.path.join(self._home, fname)
        if os.path.exists(src):
            dest = os.path.join(self._bkupdir, fname)
            shutil.move(src, dest)

    @staticmethod
    def name(fname):
        fname = fname.replace('dot', '')
        if fname.endswith('.sh'):
            fname = fname.replace(',sh', '')
        return fname

    def install(self, fname):
        self.backup(self.name(fname))
        src = os.path.join(self._cwd, fname)
        dest = os.path.join(self._home, self.name(fname))
        os.system('ln -s {} {}'.format(src, dest))
        time.sleep(0.1)


def install():
    file_installer = Installer()
    files = [x for x in os.listdir('.') if x.startswith('dot.')]
    for f in files:
        file_installer.install(f)


if __name__ == "__main__":
    install()
