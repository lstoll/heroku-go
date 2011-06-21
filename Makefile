build:
	mkdir -p dist/`uname -s`; \
	cd dist/`uname -s`; \
	6g ../../src/goweb.go; \
	6l -o goweb goweb.6; \
	rm *.6

clean:
	rm -r dist
