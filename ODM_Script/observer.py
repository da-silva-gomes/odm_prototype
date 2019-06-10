#!/usr/bin/python3
import argparse
import os
import time
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler
from git import Repo

class MonitorHandler(PatternMatchingEventHandler):
    def __init__(self, *args, **kwargs):
        super(MonitorHandler, self).__init__(*args, **kwargs)
        self.git = Repo(os.getcwd()).git

    def on_created(self, event):
        print("created")

    def on_deleted(self, event):
        print("deleted")

    def on_modified(self, event):
        print("Adding files to git")
        self.git.add('.')
        print("Commiting files to git")
        self.git.commit('-m', 'Added new image')
        print("Pushing files to remote repository")
        self.git.push()

def watch_file(path):
    """ Function to watch specific file passed by arg """
    watched_dir = os.path.split(path)[0]
    patterns = [path]
    event_handler = MonitorHandler(patterns)
    observer = Observer()
    observer.schedule(event_handler, watched_dir, recursive=False)
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()

def main():
    parser = argparse.ArgumentParser(description="File watcher in python")
    parser.add_argument("-f", "--filename", help="File to watch", dest="file")
    args = parser.parse_args()
    if args.file is None:
        print("No file given")
    else:
        watch_file(args.file)

if __name__ == "__main__":
    main()
