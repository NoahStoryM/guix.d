;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (guix gexp)
             (gnu packages)
             (gnu home)
             (gnu services)
             (gnu home services shells)
             (gnu home services niri)
             (private packages font-maple-mono)
             #;(private packages v2ray))

(home-environment
 ;; Below is the list of packages that will show up in your
 ;; Home profile, under ~/.guix-home/profile.
 (packages
  (cons*
   ;; Fonts
   font-maple-mono-nl-nf-cn-unhinted

   ;; ;; VPN
   ;; v2ray-core-bin

   (specifications->packages
    '( ;; Development Tools
      "racket"
      "chez-scheme"
      "mit-scheme"
      "zuo"
      "git"

      ;; Text Editors
      "emacs"
      "neovim"
      "vim"

      ;; System Utilities
      "curl"
      "trash-cli"
      "unzip"
      "zip"
      "iptables"
      "blesh"

      ;; Fonts
      "fontconfig"
      "font-gnu-freefont"
      "font-gnu-unifont"
      "unicode-emoji"

      ;; Terminal
      "libvterm"

      ;; Documentation & Tools
      "ispell"
      "libtool"

      ;; Applications
      "libreoffice"
      "ungoogled-chromium"
      "calibre"
      "steam"

      ;; Wayland Desktop
      "thunar"
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
   (service home-bash-service-type
            (home-bash-configuration
             [aliases '(["grep" . "grep --color=auto"]
                        ["ip" . "ip -color=auto"]
                        ["ll" . "ls -l"]
                        ["ls" . "ls -p --color=auto"]
                        ["ble" . "source ~/.guix-home/profile/share/blesh/ble.sh"])]
             [bashrc (list (local-file
                            "/home/noah/guix.d/user/noah/.bashrc"
                            "bashrc"))]
             [bash-profile (list (local-file
                                  "/home/noah/guix.d/user/noah/.bash_profile"
                                  "bash_profile"))]))
   %base-home-services)])
