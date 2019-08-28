# wpe-webkit-libs snap

This snap packages the lastest stable version of the [WPE WebKit fork](https://wpewebkit.org) together with its dependencies `libwpe` and `wpe-backend-fdo`. It is intended to be used as a library (build/stage) snap for other snaps – see [WPE WebKit for Mir Kiosk](https://snapcraft.io/wpe-webkit-mir-kiosk) for reference.

## Usage

Just add wpe-webkit-libs to your part's build-snaps and/or stage-snaps list, see [snapcraft parts metadata docs](https://snapcraft.io/docs/snapcraft-parts-metadata).

Example:

```yaml
parts:
  _part_name_:
    build-snaps:
      - wpe-webkit-libs # defaults to latest/stable
    # - wpe-webkit-libs/latest/candidate # if you want to choose another channel
```

All three libraries are built with `-DCMAKE_INSTALL_PREFIX:PATH=/usr` and thus are available in `$SNAP/usr/{bin,lib,libexec}`. If placed in `$SNAP/lib`, consuming snaps will have a hard time if the WebKit-dependent application doesn't play nice with snapd's confinement and expects paths like /libexec, which currently cannot be shimmed with layouts since it's directly under root.
