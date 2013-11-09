#!/usr/bin/python
################################################################################
import re
import os
import subprocess
################################################################################

class VimFormatOutput(object):
    def __init__(self, class_type, tag_type):
        self.head = '\nsyn keyword %s   ' % class_type
        self.lines = [self.head]
        self.tag = tag_type
        self.items = []
        self.ignore = ['~', '__']
        if tag_type == 'c':
            self.ignore.append('_')
    #
    def check(self, itemname):
        if itemname in self.items:
            return False
        elif itemname[0].islower() and self.tag == 'c':
            return False
        #elif any(x in self.ignore for x in itemname):
        elif any(x in itemname for x in self.ignore):
            return False
        elif len(itemname) == 1:
            return False
        return True
    #
    def append(self, itemname):
        if not self.check(itemname):
            return
        if len(itemname)  + len(self.lines[-1]) + 1 < 80:
            self.lines[-1] = '%s %s' % (self.lines[-1], itemname)
        else:
            self.lines.append('%s %s' % (self.head, itemname))
        self.items.append(itemname)
        return
    #
    def __str__(self):
        return '\n'.join(self.lines)


def get_tags():
    includes = []
    rootpath = os.getenv('ROOTSYS')
    roofitpath = '%s/roofit' % rootpath
    includes.append('%s/include/*' % rootpath)
    includes.append('%s/roofit/inc/*' % roofitpath)
    includes.append('%s/roofitcore/inc/*' % roofitpath)
    includes.append('%s/roostats/inc/*' % roofitpath)
    includes.append('/home/scphall/analyses/Scph/*/include/*')
    for cmd in ['ctags -a -R %s' % x for x in includes]:
        subprocess.call([cmd], shell=True)


def tags_regexp():
    regexp = re.compile (
        '(?P<symbol>[^\t]+)\t'
        '(?P<filename>[^\t]+)\t'
        '(?P<ex_command>.*?);"\t'
        '(?P<type>[^\t\r\n]+)'
        '(?:\t(?P<fields>.*))?'
    )
    return regexp


def post_process_tag(search_obj):
    tag = search_obj.groupdict()
    fields = tag.get('fields')
    if fields:
        tag.update(dict(f.split(':', 1) for f in fields.split('\t')))
    return tag


def get_types(tags, filter_type):
    for tag in tags:
        if tag.get('type') == filter_type:
            yield tag.get('symbol')


def vim_highlight_rules(tags, tag_type, class_type, filename=None):
    classes = VimFormatOutput(class_type, tag_type)
    for classname in get_types(tags, tag_type):
        classes.append(classname)
    if filename is not None:
        with open(filename, 'a') as f:
            f.writelines('\n'.join(classes.lines))
    else:
        print classes

def main():
    #get_tags()
    regexp = tags_regexp()
    tags = []
    with open('tags', 'r') as f:
        for l in f:
            search_obj = regexp.search(l)
            if not search_obj:
                continue
            tags.append(post_process_tag(search_obj))
    filename = 'ctypes.vim'
    vim_highlight_rules(tags, 'c', 'cType', filename)
    vim_highlight_rules(tags, 'v', 'Constant', filename)      # kTRUE
    vim_highlight_rules(tags, 't', 'cType', filename)      # Bool_t
    vim_highlight_rules(tags, 'e', 'cConstant', filename)  # kColor


if __name__ == "__main__":
    main()
