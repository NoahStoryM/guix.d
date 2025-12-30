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
             (gnu packages wm)
             (gnu system locale)
             (gnu services desktop)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules cups desktop networking ssh xorg pm sound)

(operating-system
  [users (include "users.scm")]
  [mapped-devices (include "mapped-devices.scm")]
  [file-systems (include "file-systems.scm")]

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

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  [packages
   (append
    (specifications->packages
     '(
       ;; --- Core Window Management ---
       "niri"                  ; The compositor (needed here for session entry)
       "swaylock"              ; Lock screen (best in system for PAM auth)
       "fuzzel"
       "alacritty"

       ;; --- Hardware & Drivers ---
       "bluez"                 ; Bluetooth daemon (service needs this)
       "brightnessctl"         ; Control screen brightness
       "tlp"                   ; Power management (laptop battery life)

       ;; --- System Administration (CLI) ---
       "trash-cli"
       "blesh"
       "vim"                   ; Fallback editor
       "git"
       "curl"
       "rsync"
       "wget"
       "unzip"
       "zip"
       "tree"                  ; Directory visualizer
       ))
    %base-packages)]

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  [services
   (cons*
    (service openssh-service-type)
    (simple-service
     'system:default-editor
     session-environment-service-type '(["EDITOR" . "vim"]))
    (set-xorg-configuration
     (xorg-configuration
      [keyboard-layout keyboard-layout]))
    (service bluetooth-service-type)
    (service tlp-service-type
             (tlp-configuration
              [cpu-scaling-governor-on-ac '("performance")]
              [sched-powersave-on-bat? #t]))
    (service screen-locker-service-type
             (screen-locker-configuration
              [name "swaylock"]
              [program (file-append swaylock "/bin/swaylock")]
              [using-pam? #t]
              [using-setuid? #f]))
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
  [bootloader
   (bootloader-configuration
    [bootloader grub-efi-bootloader]
    [targets (list "/boot/efi")]
    [keyboard-layout keyboard-layout])])
