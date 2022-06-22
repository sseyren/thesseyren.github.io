+++
title = "MiKTeX Installation Notes"

[taxonomies]
tags = ["TeX"]
+++

I'm just tired of updating my [TeX Live](https://www.tug.org/texlive/) installation every year. Never managed to update successfully in my life. I rarely use LaTeX. I could use an online service for compiling PDF files but I like to do things in my computer, not in someone else's.

For fixing this problem, [MiKTeX](https://miktex.org/) looks promising. I think it's like a rolling release type of distribution, which is easier to manage and update packages. Also, it has a much more pretty looking management tool.

In this blog post I wanted to cover some tips and tricks about MiKTeX installation.

# Installing Every MiKTeX Package

One of the downsides about MiKTeX is, I never managed to have meaningfull error messages. Ok, I can guess there is a package missing in my setup, but _which one_?.. Because of that, I wanted to install every package available.

`mpm` is the package manager of MiKTeX. Don't use `--install` option for installing packages because it returns error messages for already installed packages. Instead, use `--require`.

**If your installation is not system-wide, don't use `--admin` option. (also don't use `sudo`)**

```sh
sudo mpm --verbose --admin --require $(mpm --list-package-names | paste -sd ',' -)
```

This installs every package, including documentation and source packages. If you don't want to install doc and source packages, you can use the following command:

```sh
sudo mpm --verbose --admin --require $(mpm --list-package-names | grep -v __ | paste -sd ',' -)
```

_If a package name contains double underscore (\_\_) it's probably a documentation or a source package. We can use `grep -v` to skip them. For example: [`aalok`](https://miktex.org/packages/aalok), [`aalok__doc`](https://miktex.org/packages/aalok__doc), [`aalok__source`](https://miktex.org/packages/aalok__source)_

After these, you may need to rebuild [font map files](https://docs.miktex.org/manual/advanced.html#psfonts):

```sh
sudo miktex --verbose --admin fontmaps configure
```
