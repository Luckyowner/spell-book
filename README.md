# scripts
 A collection of scripts I like to keep handy

## Spells *(scripts)*

- [allgst](./allgst.sh) Performs `git status` on every folder in the `cwd`.
- [bash_color](./bash_color.sh) Display a certain RGB combo to the terminal and the
  corresponding escape sequence.
- [castRunes](castRunes.sh) Creates a sym-link for every rune in
- [changeMeWall](changeMeWall.sh) Changes the wallpaper to a random one in the
  `~/Pictures/Wallpapers` folder (requires `nitrogem`).
    - *[changeMeWallCicle](changeMeWallCicle.sh) runs this every 5 minutes.*
- [gitconfig](./gitconfig.sh) Configures git with my credentials.
- [learnspells](learnspell.sh) Creates a sym-link on `~/.local/bin` to every
  spell.
  [runes](runes/). The location of the sym-link depends on the rune and is
  defined in the script.
- [mtg-wallpapers](./mtg-wallpapers.sh) Downloads the last 6 wallpapers to show
  https://magic.wizards.com/en/articles/media/wallpapers.
- [sssh](sssh.sh) Manages ssh connections.
- [syncspellbook](./syncspellbook.sh) Tries to synchronise with changes to the
  remote repository. Also runs [updatespellbook](updatespellbook.sh)
  and [castRunes](castRunes.sh).
- [termFromHere](./termFromHere.sh) Opens a terminal in the same `cwd` as the focused `X`
  program. (Meant to be used with `i3wm`)

## Runes *(config files)*

- [aliases.zsh](runes/aliases.zsh) Aliases for z-shell.
- [fishy-2.zsh-theme](runes/fishy-2.zsh-theme) My z-shell custom theme.
- [i3](runes/i3/) i3 config folder.
- [i3status](runes/i3status) i3 status bar config folder.
- [init.vim](runes/init.vim) NeoVim configuration.
- [mpv.conf](runes/mpv.conf) mpv config.
- [startup.zsh](runes/startup.zsh) Startup commands for z-shell.
- [Xdefaults](runes/.Xdefaults) Xdefaults config (mostly urxvt).
- [zathurarc](runes/zathurarc) Zathura pdf reader config.
- [zprofile](runes/.zprofile) z-shell profile.
