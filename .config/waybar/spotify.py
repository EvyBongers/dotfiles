#!/usr/bin/env python3
import json
import signal
import sys
import typing
from datetime import timedelta
from time import sleep

from gi.repository import GLib
from pydbus import SessionBus

FORMAT: typing.Final[str] = "{title} - {artist} [{time}]"
DBUS_CLIENT: typing.Final[str] = "org.mpris.MediaPlayer2.spotify"
PLAYER_IFACE: typing.Final[str] = "org.mpris.MediaPlayer2.Player"
OBJECT_PATH: typing.Final[str] = "/org/mpris/MediaPlayer2"


def printUpdate(player):
    try:
        metadata = player.Metadata
        playbackStatus = player.PlaybackStatus

        album = metadata.get("xesam:album")
        artist = metadata.get("xesam:artist")[0]
        microtime = metadata.get("mpris:length")
        title = metadata.get("xesam:title")

        trackInfo = FORMAT.format(
            artist=artist,
            album=album,
            playback=playbackStatus,
            time=str(timedelta(seconds=microtime // 1_000_000)),
            title=title,
        )
        output = {
            "text": trackInfo,
            "class": playbackStatus.lower(),
            "alt": "Spotify",
        }
    except:
        output = {
            "text": "Playback is stopped",
            "class": "custom-spotify",
            "alt": "Spotify",
        }
    finally:
        sys.stdout.write(json.dumps(output) + "\n")
        sys.stdout.flush()


def main():
    loop = GLib.MainLoop()

    def signalHandler(sig, frame):
        loop.quit()

    signal.signal(signal.SIGCHLD, signalHandler)
    signal.signal(signal.SIGINT, signalHandler)
    signal.signal(signal.SIGTERM, signalHandler)

    bus = SessionBus()
    spotify = None
    while spotify == None:
        try:
            spotify = bus.get(DBUS_CLIENT, OBJECT_PATH)
            player = spotify[PLAYER_IFACE]

            def handlePropertiesChanged(_s, _a, _as):
                if _s == PLAYER_IFACE:
                    printUpdate(player)

            printUpdate(player)
            spotify.PropertiesChanged.connect(handlePropertiesChanged)

        except Exception:
            # Spotify isn't running, keep the loop running
            sleep(1)

    loop.run()


if __name__ == "__main__":
    main()
