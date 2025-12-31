(cons*
 (channel
  [name 'private]
  [url "https://github.com/NoahStoryM/guix.d"]
  [branch "x1c6th"])
 (channel
  [name 'nonguix]
  [url "https://gitlab.com/nonguix/nonguix"]
  [branch "master"]
  [commit "ba91bc437dba367f98608658bb4a19fb0880ad24"]
  [introduction
   (make-channel-introduction
    "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
    (openpgp-fingerprint
     "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))])
 (channel
  [inherit (car %default-channels)]
  [url "https://mirror.sjtu.edu.cn/git/guix.git"]
  [commit "867438812466f043f7440e1034f79d1ad94d01dd"])
 (cdr %default-channels))
