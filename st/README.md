## How to configure dynamically with Xresources

For many key variables, the build of `st` in my repo will look for X settings set in
either `~/.Xdefaults` or `~/.Xresources`. You must run `xrdb` on one of these
files to load the settings.

For example, you can define your desired fonts, transparency or colors:

```
*.font:	Liberation Mono:pixelsize=12:antialias=true:autohint=true;
*.alpha: 150
*.color0: #111
...
```

The `alpha` value (for transparency) goes from `0` (transparent) to `255`
(opaque).
