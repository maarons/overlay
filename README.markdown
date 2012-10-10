This is my personal Gentoo overlay.  It contains ebuilds for my software, some
ebuilds that didn’t yet make it to official tree and some hacks to get rid of
proprietary software dependencies.

# How to use

* Edit `/etc/layman/layman.cfg` and add
  `https://raw.github.com/maarons/overlay/master/repositories.xml` to
  `overlays:`.
* Fetch the new list with `layman -L`.
* Add the overlay with `layman -a maarons`.
* Enjoy=D
