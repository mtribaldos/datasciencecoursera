# RStudio installation instructions (Ubuntu 14.04 / Trusty, 64 bits)

Firstly we download the package from the RStudio website:
```
wget https://download1.rstudio.org/rstudio-0.99.903-amd64.deb
```

Then we install it, after installing other dependencies as well:
```
sudo apt-get install libjpeg62
sudo dpkg -i rstudio-0.99.903-amd64.deb
```
