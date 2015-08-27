
ALL: ui/bindata.go

.build/bin/go-bindata:
	GOPATH=`pwd`/.build go get github.com/jteeuwen/go-bindata/...

ui/bindata.go: .build/bin/go-bindata $(wildcard ui/assets/**/*)
	rsync -r --exclude '*.js' ui/assets/* .build/ui
	webpack --config webpack.config.js ui/assets/js/hound.js .build/ui/js/hound.js
	webpack --config webpack.config.js ui/assets/js/exclued_files.js .build/ui/js/excluded_files.js
	$< -o $@ -pkg ui -prefix .build/ui -nomemcopy .build/ui/...

clean:
	rm -rf .build
