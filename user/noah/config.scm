;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (guix channels)
             (guix gexp)
             (gnu packages)
             (gnu home)
             (gnu services)
             (gnu home services)
             (gnu home services guix)
             (gnu home services niri)
             (gnu home services shells)
             (private packages font-maple-mono))

(home-environment
 ;; Below is the list of packages that will show up in your
 ;; Home profile, under ~/.guix-home/profile.
 (packages
  (cons*
   ;; --- Fonts ---
   font-maple-mono-nl-nf-cn-unhinted

   (specifications->packages
    '(
      ;; --- Wayland Desktop Essentials (Niri Needs These) ---
      "xwayland-satellite"              ; X11 support (Recommended for Niri)
      "fuzzel"                          ; Application launcher
      "mako"                            ; Notification daemon
      "waybar"                          ; Status bar
      "wl-clipboard"                    ; Clipboard (CRITICAL: copy/paste)
      "clipman"                         ; Clipboard manager
      "swaybg"                          ; Wallpaper tool
      "wlogout"                         ; Power/Logout menu
      "grim"                            ; Screenshot tool
      "slurp"                           ; Select region for screenshot
      "swappy"                          ; Screenshot editor
      "udiskie"                         ; Automounter for USB drives (tray icon)
      "polkit-gnome"                    ; Auth Agent (CRITICAL: GUI password prompts)
      "polkit"

      ;; --- Portals (File dialogs & Screen sharing) ---
      "xdg-desktop-portal"
      "xdg-desktop-portal-wlr"
      "xdg-desktop-portal-gtk"          ; Use GTK file picker

      ;; --- GUI Applications ---
      "alacritty"                       ; Terminal
      "firefox"
      "ungoogled-chromium"
      "thunar"                          ; File manager
      "pavucontrol"                     ; Audio control GUI
      "blueman"                         ; Bluetooth manager GUI
      "imv"                             ; Image viewer
      "mpv"                             ; Video player
      "libreoffice"
      "calibre"
      "steam"

      ;; --- Development Tools ---
      "make"
      "cmake"
      "gcc-toolchain"
      "libtool"
      "racket"
      "chez-scheme"
      "mit-scheme"
      "zuo"
      "python"

      ;; --- Editors ---
      "vim"
      "neovim"
      "emacs-pgtk"                      ; Pure GTK build for Wayland

      ;; --- Emacs Packages ---
      "emacs-evil"
      "emacs-evil-org"
      "emacs-guix"
      "emacs-geiser"
      "emacs-geiser-chez"
      "emacs-geiser-guile"
      "emacs-geiser-racket"
      "emacs-magit"
      "emacs-meow"
      "emacs-multi-vterm"
      "emacs-org"
      "emacs-racket-mode"
      "emacs-vterm"

      ;; --- Fonts ---
      "fontconfig"
      "font-gnu-freefont"
      "font-gnu-unifont"
      "font-awesome-nonfree"            ; Icons for Waybar
      "unicode-emoji"

      ;; --- CLI Utilities ---
      "libvterm"
      "libnotify"                       ; 'notify-send' command
      "ispell"
      "playerctl"                       ; Media key control
      "pamixer"                         ; Audio volume CLI
      "trash-cli"
      "blesh"
      "vim"                             ; Fallback editor
      "git"
      "curl"
      "rsync"
      "wget"
      "unzip"
      "zip"
      "tree"                            ; Directory visualizer
      ))))

 ;; Below is the list of Home services.  To search for available
 ;; services, run 'guix home search KEYWORD' in a terminal.
 [services
  (cons*
   (service home-niri-service-type)
   (service home-channels-service-type (include "../../channels.scm"))
   (simple-service 'noah:default-editor
                   home-environment-variables-service-type
                   '(["EDITOR" . "emacs"]))
   (service home-bash-service-type
            (home-bash-configuration
             [aliases '(["grep" . "grep --color=auto"]
                        ["ip"   . "ip -color=auto"]
                        ["l"    . "ls -CF"]
                        ["la"   . "ls -A"]
                        ["ll"   . "ls -alF"]
                        ["ls"   . "ls -p --color=auto"]
                        ["ble"  . "source ~/.guix-home/profile/share/blesh/ble.sh"])]
             [bashrc (list (local-file (include ".bashrc.scm") "bashrc"))]
             [bash-profile (list (local-file (include ".bash_profile.scm") "bash_profile"))]))
   %base-home-services)])
