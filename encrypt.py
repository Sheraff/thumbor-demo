#!/usr/bin/env python

import base64
import hashlib
import hmac
from six import text_type

key = raw_input("Key: ")
value = raw_input("Value: ")

code = base64.urlsafe_b64encode(
	hmac.new(
		key, 
		text_type(value).encode('utf-8'), 
		hashlib.sha1)
	.digest())

print code