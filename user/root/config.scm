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
             (gnu home services guix)
             (gnu home services shells)
             (private packages v2ray))

(home-environment
 ;; Below is the list of packages that will show up in your
 ;; Home profile, under ~/.guix-home/profile.
 [packages
  (cons*
   ;; VPN
   Xray-core-bin
   v2raya-bin

   (specifications->packages
    '(;; Fonts
      "unicode-emoji"

      ;; System Utilities
      "trash-cli"
      "blesh")))]

 ;; Below is the list of Home services.  To search for available
 ;; services, run 'guix home search KEYWORD' in a terminal.
 [services
  (cons*
   (service home-channels-service-type (include "/home/noah/guix.d/channels.scm"))
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
                            "/home/noah/guix.d/user/root/.bashrc"
                            "bashrc"))]
             [bash-profile (list (local-file
                                  "/home/noah/guix.d/user/root/.bash_profile"
                                  "bash_profile"))]))
   %base-home-services)])
