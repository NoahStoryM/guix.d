(define-module (private packages v2ray)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix licenses)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages linux))

(define-public v2ray-core-bin
  (package
    [name "v2ray-core-bin"]
    [version "5.42.0"]
    [source (origin
              [method url-fetch]
              [uri (string-append
                    "https://github.com/v2fly/v2ray-core/releases/download/v"
                    version "/v2ray-linux-64.zip")]
              [sha256 (base32 "0lzd7ggqqvvgx19bxvgqgl0hcd4bls0llk4czhqqyy046w50m4k8")])]
    [build-system copy-build-system]
    [native-inputs (list unzip)]
    [inputs (list bash-minimal)]
    [arguments
     (list
      #:install-plan
      #~'(["v2ray"       "bin/v2ray"]
          ["geoip.dat"   "share/v2ray/geoip.dat"]
          ["geosite.dat" "share/v2ray/geosite.dat"])
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" source)))
          (add-after 'install 'wrap-v2ray
            (lambda* (#:key outputs #:allow-other-keys)
              (let ([out (assoc-ref outputs "out")])
                (let ([bin (string-append out "/bin/v2ray")]
                      [assets (string-append out "/share/v2ray")])
                  (wrap-program bin `("V2RAY_LOCATION_ASSET" = (,assets)))))))))]
    [home-page "https://www.v2fly.org"]
    [synopsis "Project V core (Binary)"]
    [description "A platform for building proxies to bypass network restrictions."]
    [license expat]))

(define-public v2raya-bin
  (package
    [name "v2raya-bin"]
    [version "2.2.7.4"]
    [source (origin
              [method url-fetch]
              [uri (string-append
                    "https://github.com/v2rayA/v2rayA/releases/download/v"
                    version "/v2raya_linux_x64_" version)]
              [sha256 (base32 "0apxd4yrcj90lq3v8l4nnvxb7f404cz2nr1bd1k9dz8achyl2240")])]
    [build-system copy-build-system]
    [native-inputs (list unzip)]
    [inputs (list bash-minimal iptables v2ray-core-bin)]
    [arguments
     (list
      #:install-plan
      #~`([,(string-append "v2raya_linux_x64_" #$version) "bin/v2raya"])
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source (string-append "v2raya_linux_x64_" #$version))))
          (add-before 'install 'chmod
            (lambda _
              (chmod (string-append "v2raya_linux_x64_" #$version) #o755)))
          (add-after 'install 'wrap-v2raya
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ([out (assoc-ref outputs "out")])
                (let ([bin (string-append out "/bin/v2raya")]
                      [v2ray-path (assoc-ref inputs "v2ray-core-bin")]
                      [iptables-path (assoc-ref inputs "iptables")])
                  (wrap-program bin
                    `("PATH" prefix (,(string-append v2ray-path "/bin")
                                     ,(string-append iptables-path "/sbin")
                                     ,(string-append iptables-path "/bin"))))))))))]
    [home-page "https://v2raya.org"]
    [synopsis "v2rayA web client (Binary)"]
    [description "A V2Ray client supporting global transparent proxy."]
    [license agpl3+]))
