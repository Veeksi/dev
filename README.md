# Instructions
- Install packages: `DEV_ENV="$PWD" ./run`
- Setup dotfiles: `DEV_ENV="$PWD" ./dev-env`

# Keybinds
- Use: `SUPER + SHIFT + R`
- Waybar: `SUPER + SHIFT + W`

# Wayland support
## Android studio
- Go to: `Help -> Edit Custom WM Options`
- Put this: `-Dawt.toolkit.name=WLToolkit`
- Read more: https://blog.jetbrains.com/platform/2024/07/wayland-support-preview-in-2024-2/

## Vscode
- Find your desktop entry
    - Usually `/usr/share/applications` or `~/.local/share/applications`
- Add into desktop entry exec: `--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto`
- Update entry: `sudo update-desktop-database /usr/share/applications`

## Brave
- Go to this URL: `brave://flags/#ozone-platform-hint`
- Set: `Wayland`
