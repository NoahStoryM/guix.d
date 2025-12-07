;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
             (gnu system locale)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules cups desktop networking ssh xorg)
(include "file-systems.scm")

(operating-system
  [locale "en_US.utf8"]
  [locale-definitions
   (cons*
    (locale-definition [name "zh_CN.utf8"] [source "zh_CN"])
    %default-locale-definitions)]
  [timezone "Asia/Shanghai"]
  [keyboard-layout
   (keyboard-layout
    "us"
    #:options '("ctrl:swapcaps" "parens:swap_brackets"))]
  [host-name "x1c6th"]

  ;; Nonguix
  [kernel linux]
  [initrd microcode-initrd]
  [firmware (list linux-firmware)]

  ;; The list of user accounts ('root' is implicit).
  [users (cons* (user-account
                 [name "noah"]
                 [comment "Noah"]
                 [group "users"]
                 [home-directory "/home/noah"]
                 [supplementary-groups '("wheel" "netdev" "audio" "video")])
                %base-user-accounts)]

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  [packages (append (specifications->packages '("niri" "fuzzel" "alacritty" "swaylock"))
                    %base-packages)]

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  [services (cons*
             ;; To configure OpenSSH, pass an 'openssh-configuration'
             ;; record as a second argument to 'service' below.
             (service openssh-service-type)
             (set-xorg-configuration
              (xorg-configuration [keyboard-layout keyboard-layout]))
             (modify-services %desktop-services
               [guix-service-type
                config =>
                (guix-configuration
                 [inherit config]
                 [substitute-urls
                  (cons* "https://substitutes.nonguix.org"
                         "https://mirror.sjtu.edu.cn/guix"
                         "https://ci.guix.gnu.org"
                         "https://bordeaux.guix.gnu.org"
                         %default-substitute-urls)]
                 [authorized-keys
                  (cons*
                   (local-file "../non-guix.pub")
                   %default-authorized-guix-keys)])]))]
  [bootloader (bootloader-configuration
               [bootloader grub-efi-bootloader]
               [targets (list "/boot/efi")]
               [keyboard-layout keyboard-layout])]
  [mapped-devices (list (mapped-device
                         [source (uuid "f2a01d64-40c9-4bda-b687-e44a8bbb071c")]
                         [target "cryptroot"]
                         [type luks-device-mapping]))]

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  [file-systems %file-systems])
