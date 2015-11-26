
APP=kata-01

.PHONY: init build clean repl test


build:
	cabal build

all: init build
	echo "Done!"

clean:
	cabal clean

init:
	cabal sandbox init
	cabal install --only-dependencies
	cabal configure

test:
	@dist/build/$(APP)/$(APP)

repl:
	cabal repl

