## R installation instructions (Ubuntu 14.04 / Trusty)

First we add the repository to /etc/apt/sources.list:
```
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
```

The original source (CRAN) must be authenticated, so:
```
export KEY=E084DAB9
gpg --keyserver keyserver.ubuntu.com --recv-key $KEY
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
```

And finally we install the package:
```
sudo apt-get -y install r-base
```
