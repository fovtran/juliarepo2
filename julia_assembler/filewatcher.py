import os

class Monkey(object):
    def __init__(self):
        self._cached_stamp = 0
        self.filename = '/path/to/file'

    def ook(self):
        stamp = os.stat(self.filename).st_mtime
        if stamp != self._cached_stamp:
            self._cached_stamp = stamp
            print("File changed")
