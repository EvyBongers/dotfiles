#!/usr/bin/env python3
import json
import signal
import sys
import typing

from gi.repository import GLib
from pydbus import SessionBus

MODES: typing.Final[dict] = {
    "dark": '{"text":"","class":"dark"}',
    "light": '{"text":"","class":"light"}',
}

PORTAL_BUS_NAME: typing.Final[str] = "nl.whynothugo.darkman"
PORTAL_OBJ_PATH: typing.Final[str] = "/nl/whynothugo/darkman"


def main():
    loop = GLib.MainLoop()

    def signalHandler(sig, frame):
        loop.quit()

    signal.signal(signal.SIGCHLD, signalHandler)
    signal.signal(signal.SIGINT, signalHandler)
    signal.signal(signal.SIGTERM, signalHandler)

    bus = SessionBus()
    obj = bus.get(PORTAL_BUS_NAME, PORTAL_OBJ_PATH)

    def printMode(mode):
        try:
            sys.stdout.write(MODES[mode] + "\n")
            sys.stdout.flush()
        except:
            sys.stderr.write("Unknown mode {}\n".format(mode))
            sys.stderr.flush()

    obj.ModeChanged.connect(printMode)
    printMode(obj.Mode)

    loop.run()


if __name__ == "__main__":
    main()
