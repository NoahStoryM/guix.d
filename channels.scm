(cons*
 (channel
  [name 'private]
  [url "file:///home/noah/guix.d"]
  [branch "x1c6th"])
 (channel
  [name 'nonguix]
  [url "https://gitlab.com/nonguix/nonguix"]
  [commit "d741f41eca0a04694775118eedaa332ffa1a26f8"]
  [introduction
   (make-channel-introduction
    "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
    (openpgp-fingerprint
     "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))])
 (channel
  [inherit (car %default-channels)]
  [url "https://mirror.sjtu.edu.cn/git/guix.git"]
  [commit "32edabdabd58e74edd7b57774fea977084cdf826"])
 (cdr %default-channels))
