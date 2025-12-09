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
   ;; Fonts
   font-maple-mono-nl-nf-cn-unhinted

   (specifications->packages
    '( ;; Development Tools
      "git"
      "racket"
      "chez-scheme"
      "mit-scheme"
      "zuo"
      "python"
      "gcc-toolchain"
      "make"
      "cmake"

      ;; System Utilities
      "curl"
      "trash-cli"
      "unzip"
      "zip"
      "blesh"

      ;; Text editors
      "emacs-pgtk"
      "neovim"

      ;; Emacs packages
      "emacs-evil"
      "emacs-evil-org"
      "emacs-guix"
      "emacs-geiser"
      "emacs-geiser-chez"
      "emacs-geiser-guile"
      "emacs-geiser-racket"
      "emacs-magit"
      "emacs-multi-vterm"
      "emacs-org"
      "emacs-racket-mode"
      "emacs-vterm"

      ;; Fonts
      "fontconfig"
      "font-gnu-freefont"
      "font-gnu-unifont"
      "font-awesome-nonfree"
      "unicode-emoji"

      ;; Tools
      "libvterm"
      "libtool"

      ;; Documentation
      "ispell"

      ;; Applications
      "firefox"
      "ungoogled-chromium"
      "libreoffice"
      "calibre"
      "texlive"
      "texlive-biblatex"
      "steam"

      ;; Wayland Desktop
      "pavucontrol"
      "pamixer"
      "brightnessctl"
      "mako"
      "waybar"
      "xwayland-satellite"

      ;; File Browser
      "thunar"))))

 ;; Below is the list of Home services.  To search for available
 ;; services, run 'guix home search KEYWORD' in a terminal.
 [services
  (cons*
   (service home-niri-service-type)
   (service home-channels-service-type (include "/home/noah/guix.d/channels.scm"))
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
             [bashrc (list (local-file
                            "/home/noah/guix.d/user/noah/.bashrc"
                            "bashrc"))]
             [bash-profile (list (local-file
                                  "/home/noah/guix.d/user/noah/.bash_profile"
                                  "bash_profile"))]))
   %base-home-services)])
