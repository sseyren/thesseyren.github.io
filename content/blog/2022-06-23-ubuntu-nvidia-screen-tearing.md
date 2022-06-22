+++
title = "Fixing Screen Tearing Issue for Nvidia Drivers on Ubuntu 20.04"

[taxonomies]
tags = ["ubuntu", "drivers", "nvidia"]
+++

You may encounter some problems with proprietary nvidia drivers if you have a graphic card that comes with [nvidia optimus technology](https://www.nvidia.com/en-us/geforce/technologies/optimus/technology/). For my case[^1], it was screen tearing issue.

To fix this issue, we need to open `/lib/modprobe.d/nvidia-kms.conf` and append this line to that file:
```
options nvidia-drm modeset=1 
```

Don't forget to reboot your system.


[^1]: _NVIDIA Corporation GP108M [GeForce MX150] [10de:1d10] (rev a1)_
