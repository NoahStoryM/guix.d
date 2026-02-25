(cons*
 (channel
  [name 'private]
  [url "https://github.com/NoahStoryM/guix.d"]
  [branch "x1c6th"])
 (channel
  [name 'nonguix]
  [url "https://gitlab.com/nonguix/nonguix"]
  [branch "master"]
  [commit "4811a684f4ced58cebfa945c3ccbbca6c26807fd"]
  [introduction
   (make-channel-introduction
    "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
    (openpgp-fingerprint
     "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))])
 (channel
  [inherit (car %default-channels)]
  [url "https://mirror.sjtu.edu.cn/git/guix.git"]
  [commit "99556e7724b3dd65e2be0dd06b7b69695c9c7901"])
 (cdr %default-channels))
