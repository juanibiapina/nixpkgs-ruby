.PHONY: all
all: test clean

.PHONY: test
test:
	nix-build test.nix

.PHONY: clean
clean:
	rm result*
