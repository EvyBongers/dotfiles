#!/usr/bin/env python3
from datetime import timedelta
from time import sleep
import typing

from pydbus import SessionBus

FORMAT: typing.Final[str] = "{title} - {artist} [{time}]"
DBUS_CLIENT: typing.Final[str] = "org.mpris.MediaPlayer2.spotify"
PLAYER_IFACE: typing.Final[str] = "org.mpris.MediaPlayer2.Player"
OBJECT_PATH: typing.Final[str] = "/org/mpris/MediaPlayer2"

def main():
    bus = SessionBus()
    try:
        busObject = bus.get(DBUS_CLIENT, OBJECT_PATH)
        player = busObject[PLAYER_IFACE]

        try:
            metadata = player.Metadata
            album = metadata.get("xesam:album")
            artist = metadata.get("xesam:artist")[0]
            microtime = metadata.get("mpris:length")
            title = metadata.get("xesam:title")

            playback_status = player.PlaybackStatus

            print(
                FORMAT.format(
                    artist=artist,
                    album=album,
                    playback=playback_status,
                    time=str(timedelta(seconds=microtime // 1_000_000)),
                    title=title,
                )
            )
        except Exception:
            # Playpack is stopped

            # TODO: find what data is available
            pass

    except Exception:
        # Spotify isn't running
        pass

if __name__ == "__main__":
    main()
