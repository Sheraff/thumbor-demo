# setup: 
#   - projector: chrome, terminal, visual code
#   - computer: textedit w/ commands.sh opened, Bear w/ note opened to answer questions
#
# possible image to use: https://i.ytimg.com/vi/7EP8NqQyUmM/maxresdefault.jpg

sh install.sh

thumbor
open http://localhost:8888/unsafe/[URL]
# 10x10:100x100
# 200x300
# fit-in
# full-fit-in
# filters:format(webp)
# filters:quality(50)
# filters:grayscale()
# :blur(2)
# meta

thumbor-config > thumbor.conf && open thumbor.conf
# change quality to 20
thumbor --conf="thumbor.conf"
# open new Terminal tab
open http://localhost:8888/unsafe/[URL]

echo "SECURITY_KEY = 'MY_SECURE_KEY'" >> thumbor.conf
# reboot thumbor
# show python script
python encrypt.py
open http://localhost:8888/[KEY]/[URL]

echo "
UPLOAD_ENABLED = True
UPLOAD_PHOTO_STORAGE = 'thumbor.storages.file_storage'
FILE_STORAGE_ROOT_PATH = './thumbor/storage'
" >> thumbor.conf
# reboot thumbor
curl -o picture.jpg "[URL]"
curl -i -H "Content-Type: image/jpeg" -H "Slug: photo.jpg" -XPOST http://localhost:8888/image --data-binary "@picture.jpg"
# -i to see response headers
# --data-binary to be able to just pass a filename w/ '@'
open http://localhost:8888/unsafe/http://localhost:8888[LOCATION]
# POST
# PUT
# DELETE

echo "
RESULT_STORAGE_EXPIRATION_SECONDS = 80000
RESULT_STORAGE_STORES_UNSAFE = True
RESULT_STORAGE_FILE_STORAGE_ROOT_PATH = './thumbor/result_storage'
" >> thumbor.conf
# reboot thumbor
open http://localhost:8888/unsafe/filters:grayscale()/http://localhost:8888[LOCATION]
open ./thumbor/result_storage


brew install mozjpeg # install mozjpeg
# cloudinary while installing => upload image => get link => add `q_auto` after image/upload/
sudo -H pip install thumbor-plugins # install optimizers
echo "
OPTIMIZERS = [ 'thumbor_plugins.optimizers.mozjpeg' ]
" >> thumbor.conf
# reboot thumbor
# show comparisons in Network tab for q_auto & filters:quality(72)
# show comparisons in Network tab for .webp & filters:format(webp)
