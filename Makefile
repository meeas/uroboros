all: uro

uro: _build
	go build -o _build/uro cmd/uro/*.go

test-process: _build
	go build -o _build/test-process cmd/test-process/*.go

install: uro
	if [ ! -d "/usr/local/bin/" ]; then \
	mkdir /usr/local/bin/; \
        export PATH=${{$}}PATH:/usr/local/bin/; \
	fi
	cp _build/uro /usr/local/bin/; \
        chmod a+x /usr/local/bin/uro; \
	
_build:
	mkdir -p _build

clean:
	rm -rf _build
