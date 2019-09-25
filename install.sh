# install openssl
brew reinstall openssl

# install pycurl
sudo -H pip uninstall pycurl
export PYCURL_SSL_LIBRARY=openssl
easy_install "pycurl=7.43.0.1"

# for demo purposes, start without thumbor
sudo -H pip uninstall thumbor
# if thumbor was installed w/ python 3 before
sudo -H pip3 uninstall thumbor

# install thumbor (forcing version of python)
sudo -H /usr/bin/python -m pip install thumbor