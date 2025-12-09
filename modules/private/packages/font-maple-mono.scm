(define-module (private packages font-maple-mono)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system font)
  #:use-module (guix licenses))

(define-public font-maple-mono-nl-nf-cn-unhinted
  (package
    [name "font-maple-mono-nl-nf-cn-unhinted"]
    [version "7.9"]
    [source (origin
              [method url-fetch]
              [uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v"
                    version "/MapleMonoNL-NF-CN-unhinted.zip")]
              [sha256 (base32 "1j8a763dnqdr0a3v5rm8c8mc0jhlg2ryd0kw259mnskj89lsqc3d")])]
    [build-system font-build-system]
    [home-page "https://github.com/subframe7536/maple-font"]
    [synopsis "Maple Mono font with Nerd Font icons and Chinese/Japanese characters."]
    [description "Maple Mono font."]
    [license silofl1.1]))
