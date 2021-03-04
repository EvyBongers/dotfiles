#!/usr/bin/env python3
from datetime import timedelta
from time import sleep
import typing
from gi.repository import GLib
import signal
import sys
import json

from pydbus import SessionBus

FORMAT: typing.Final[str] = "{title} - {artist} [{time}]"
DBUS_CLIENT: typing.Final[str] = "org.mpris.MediaPlayer2.spotify"
PLAYER_IFACE: typing.Final[str] = "org.mpris.MediaPlayer2.Player"
OBJECT_PATH: typing.Final[str] = "/org/mpris/MediaPlayer2"


def printUpdate(metadata, playbackStatus):
    album = metadata.get("xesam:album")
    artist = metadata.get("xesam:artist")[0]
    microtime = metadata.get("mpris:length")
    title = metadata.get("xesam:title")
    print(
        json.dumps(
            {
                "text": FORMAT.format(
                    artist=artist,
                    album=album,
                    playback=playbackStatus,
                    time=str(timedelta(seconds=microtime // 1_000_000)),
                    title=title,
                ),
            }
        ),
    )


def main():
    bus = SessionBus()

    #loop = GLib.MainLoop()
    #def signalHandler(sig, frame):
    #    loop.quit()

    #signal.signal(signal.SIGINT, signalHandler)
    #signal.signal(signal.SIGTERM, signalHandler)

    try:
        spotify = bus.get(DBUS_CLIENT, OBJECT_PATH)
        player = spotify[PLAYER_IFACE]

        try:
            metadata = player.Metadata
            playbackStatus = player.PlaybackStatus
            printUpdate(metadata, playbackStatus)

        except Exception:
            # Playpack is stopped

            # TODO: find what data is available
            pass

        #spotify.PropertiesChanged.connect(
        #    lambda _s, _a, _as: printUpdate(_a["Metadata"], _a["PlaybackStatus"])
        #)
        #loop.run()

    except Exception:
        # Spotify isn't running
        print("Spotify isn't running!", file=sys.stderr)
        pass


if __name__ == "__main__":
    main()
