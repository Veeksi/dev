# dev

Dotfiles and dev environment setup for Arch Linux / Hyprland.

## Instructions

- **Install packages:** `DEV_ENV="$PWD" ./run` (optionally pass a name to run only matching scripts, e.g. `./run rust`)
- **Setup dotfiles:** `DEV_ENV="$PWD" ./dev-env`
- **Apply dotfiles and restart waybar/hyprpaper:** `DEV_ENV="$PWD" ./scripts/dev-env-launcher`

Preview changes without modifying the system:
- `DEV_ENV="$PWD" ./run --dry` or `./run --dry-run`
- `DEV_ENV="$PWD" ./dev-env --dry`

## Keybinds
- Use: `SUPER + SHIFT + R`
- Waybar: `SUPER + SHIFT + W`

## Wayland support
## Android studio
- Go to: `Help -> Edit Custom WM Options`
- Put this: `-Dawt.toolkit.name=WLToolkit`
- Read more: https://blog.jetbrains.com/platform/2024/07/wayland-support-preview-in-2024-2/

## Vscode
- Find your desktop entry
    - Usually `/usr/share/applications` or `~/.local/share/applications`
- Add into desktop entry exec: `Exec=/usr/bin/code --ozone-platform-hint=wayland`
- Update entry: `sudo update-desktop-database /usr/share/applications`

## Brave
- Go to this URL: `brave://flags/#ozone-platform-hint`
- Set: `Wayland`
