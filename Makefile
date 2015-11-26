
APP=kata-01

.PHONY: init deps build clean repl test


build:
	cabal build

all: init build
	echo "Done!"

clean:
	cabal clean

init:
	cabal sandbox init
	cabal configure

deps:
	cabal install --only-dependencies

test:
	@dist/build/$(APP)/$(APP)

repl:
	cabal repl

