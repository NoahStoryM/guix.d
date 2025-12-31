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
      "xwayland-satellite"    ; X11 support (Recommended for Niri)
      "fuzzel"                ; Application launcher
      "mako"                  ; Notification daemon
      "waybar"                ; Status bar
      "wl-clipboard"          ; Clipboard (CRITICAL: copy/paste)
      "clipman"               ; Clipboard manager
      "swaybg"                ; Wallpaper tool
      "wlogout"               ; Power/Logout menu
      "grim"                  ; Screenshot tool
      "slurp"                 ; Select region for screenshot
      "swappy"                ; Screenshot editor
      "udiskie"               ; Automounter for USB drives (tray icon)
      "polkit-gnome"     ; Auth Agent (CRITICAL: GUI password prompts)
      "polkit"

      ;; --- Flatpak ---
      "flatpak"

      ;; --- Portals (File dialogs & Screen sharing) ---
      "xdg-desktop-portal-wlr"
      "xdg-desktop-portal-gtk"          ; Use GTK file picker

      ;; --- Spell Checker ---
      "aspell"
      "aspell-dict-en"
      "guile-aspell"
      "wordnet"

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

      ;; --- Tree Sitter ---
      "tree-sitter"
      "tree-sitter-cli"
      "tree-sitter-scheme"
      "tree-sitter-racket"
      "tree-sitter-clojure"
      "tree-sitter-clisp"
      "tree-sitter-elisp"
      "tree-sitter-agda"
      "tree-sitter-haskell"
      "tree-sitter-python"
      "tree-sitter-rust"
      "tree-sitter-zig"
      "tree-sitter-c"
      "tree-sitter-c-sharp"
      "tree-sitter-cpp"
      "tree-sitter-asm"
      "tree-sitter-java"
      "tree-sitter-javascript"
      "tree-sitter-typescript"
      "tree-sitter-verilog"
      "tree-sitter-comment"
      "tree-sitter-org"
      "tree-sitter-markdown"
      "tree-sitter-latex"
      "tree-sitter-bash"
      "tree-sitter-make"
      "tree-sitter-cmake"
      "tree-sitter-vim"
      "tree-sitter-sql"
      "tree-sitter-kdl"
      "tree-sitter-json"
      "tree-sitter-yaml"
      "tree-sitter-html"
      "tree-sitter-xml"
      "tree-sitter-csv"
      "tree-sitter-css"
      "tree-sitter-gitignore"
      "tree-sitter-gitcommit"
      "tree-sitter-gitattributes"

      ;; --- Editors ---
      "vim"
      "neovim"
      "emacs-pgtk"                      ; Pure GTK build for Wayland

      ;; --- Emacs Packages ---

      ;; --- Emacs Environment ---
      "emacs-guix"              ; Guix package management within Emacs

      ;; --- API ---
      "emacs-dash"                      ; List API library

      ;; --- Help ---
      "emacs-helpful"

      ;; --- Window ---
      "emacs-ace-window"

      ;; --- Completion Framework (The "Vertico" Stack) ---
      "emacs-vertico"         ; Vertical completion UI
      "emacs-orderless"       ; Better pattern matching for completion
      "emacs-marginalia"      ; Richer annotations in minibuffer
      "emacs-consult"         ; Useful search and navigation commands
      "emacs-embark"          ; Context actions for anything at point
      "emacs-wgrep"           ; Edit grep/search buffers directly

      ;; --- In-buffer Completion & UI Enhancements ---
      "emacs-corfu"           ; Lightweight completion overlay (popup)
      "emacs-corfu-terminal"  ; Corfu support for terminal sessions
      "emacs-cape"            ; Completion At Point Extensions
      "emacs-capf-autosuggest"      ; History-based auto-suggestions
      "emacs-kind-icon"             ; Colorful icons for completion UI

      ;; --- Editing & Navigation ---
      "emacs-meow"      ; Modal editing (powerful alternative to Evil)
      "emacs-avy"       ; Jump to any character/line on screen
      "emacs-paredit"   ; Emacs minor mode for editing parentheses
      "emacs-smartparens" ; Paredit-like insertion, wrapping and navigation with user defined pairs

      ;; --- File Manager ---
      "emacs-dirvish"                   ; Improved version of dired
      "emacs-dired-du"                  ; Dired with recursive directory sizes
      "emacs-diredfl"                   ; Extra font lock

      ;; --- Programming & Lisp Development ---
      "emacs-geiser"                    ; Generic Scheme interaction
      "emacs-geiser-chez"               ; Chez Scheme support
      "emacs-geiser-guile"              ; GNU Guile support
      "emacs-geiser-racket"             ; Racket support
      "emacs-racket-mode"               ; Major mode for Racket
      "emacs-scribble-mode"             ; Major mode for Scribble
      "emacs-magit"                     ; The legendary Git interface

      ;; --- Language Modes & Format Support ---
      "emacs-markdown-mode"             ; Markdown editing
      "emacs-yaml-mode"                 ; YAML configuration files
      "emacs-json-mode"                 ; JSON data files
      "emacs-csv-mode"                  ; CSV data files
      "emacs-csv"        ; ELisp functions for reading and parsing CSV

      ;; --- Terminal & Shell Integration ---
      "emacs-vterm"               ; High-performance libvterm terminal
      "emacs-multi-vterm"         ; Manage multiple vterm buffers
      "emacs-eat"      ; "Emulate A Terminal" (fast terminal in ELisp)
      "emacs-eshell-syntax-highlighting" ; Colors for Eshell

      ;; --- Aesthetics & Icons ---
      "emacs-doom-modeline"  ; Modern, fancy status line
      "emacs-doom-themes"    ; Large collection of high-quality themes
      "emacs-solarized-theme"           ; Classic Solarized colors
      "emacs-spacemacs-theme"           ; The Spacemacs color palette
      "emacs-nerd-icons"                ; Support for Nerd Font icons
      "emacs-rainbow-delimiters" ; Highlight brackets according to their depth

      ;; --- Templates ---
      "emacs-tempel"                    ; A tiny template package

      ;; --- Input Method ---
      "emacs-pyim"
      "emacs-pyim-basedict"

      ;; --- Benchmark ---
      "emacs-benchmark-init"

      ;; --- Posframe ---
      "emacs-posframe"

      ;; --- Fonts ---
      "fontconfig"
      "font-gnu-freefont"
      "font-gnu-unifont"
      "font-awesome-nonfree"            ; Icons for Waybar
      "unicode-emoji"

      ;; --- CLI Utilities ---
      "libvterm"
      "libnotify"                       ; `notify-send' command
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
