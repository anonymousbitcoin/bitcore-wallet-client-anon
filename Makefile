.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	bitcore-wallet-client-anon.min.js

clean:
	rm bitcore-wallet-client-anon.js
	rm bitcore-wallet-client-anon.min.js

bitcore-wallet-client-anon.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

bitcore-wallet-client-anon.min.js: bitcore-wallet-client-anon.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
