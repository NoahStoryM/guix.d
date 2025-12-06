(define-module (private packages v2ray)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix licenses))

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
    [arguments
     `(#:install-plan
       '(["v2ray" "bin/v2ray"]
         ["geoip.dat" "share/v2ray/geoip.dat"]
         ["geosite.dat" "share/v2ray/geosite.dat"])
       #:phases
       (modify-phases %standard-phases
         (add-before 'install 'chmod
           (lambda _ (chmod "v2ray" #o755) #t))))]
    [home-page "https://www.v2fly.org/"]
    [synopsis "Project V core (Binary)"]
    [description "A platform for building proxies to bypass network restrictions."]
    [license expat]))

#;
(define-public v2raya
  (package
    [name "v2raya"]
    [version "2.3.4"] ; 请使用最新稳定版本
    [source (origin
              [method git-fetch]
              [uri (git-reference
                    (url "https://github.com/v2rayA/v2rayA")
                    (commit (string-append "v" version)))]
              [file-name (git-file-name name version)]
              [sha256 (base32 "0yyy...")])] ; 需要填写正确的哈希值
    [build-system go-build-system]
    [arguments
     `(#:import-path "github.com/v2rayA/v2rayA"
       #:install-source? #f
       #:phases
       (modify-phases %standard-phases
         ;; 因为 v2rayA 是一个前端服务，可能需要额外的安装后步骤
         ;; 例如，确保其可以找到 v2ray-core 可执行文件
         ))]
    [inputs `(("v2ray-core" ,v2ray-core))]
    [home-page "https://github.com/v2rayA/v2rayA"]
    [synopsis "A web-based GUI client for V2Ray"]
    [description "v2rayA is a V2Ray Linux client supporting global transparent proxy."]
    [license agpl3+]))
