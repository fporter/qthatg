# qthatg

This is a game made in Godot, mainly for learning.

That can deploy to web & flatpak (mainly for steamdeck).

## Building

### Dependencies

I use arch, likely you will need these as the main packages.
```
$ pacman -S godot flatpak flatpak-builder
```
### Instructions

1. Open godot and make sure to download export templates
2. Once complete, you can close godot
3. Make linux binaries
```
$ ./scripts/package.sh
```

## Installation with Flatpak

### Local Testing
1. Follow build instructions
2. Run script
```
$ ./scripts/install.sh
```

### Steamdeck/remote
1. Follow build instructions
2. Create Flatpak repo
```
$ ./scripts/build-repo.sh
```
3. Switch to desktop mode on steamdeck
4. Rsync repo to steamdeck
```
$ rsync -a username@remote_host:/dir/to/qthatg/pak/repo ~/
``` 
5. Install app
```
$ flatpak --user remote-add --no-gpg-verify local-repo ~/repo
$ flatpak --user install local-repo com.example.qthatg
```
6. Add app to steamdeck, via desktop mode
7. Leave desktop mode, app will be available in library

*note* you only need to do step 4 & `$ flatpak update`
after the initial installation.

### Uninstall

```
$ flatpak uninstall com.example.qthatg
$ flatpak remote-delete local-repo
```
