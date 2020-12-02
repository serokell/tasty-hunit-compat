# SPDX-FileCopyrightText: 2020 Serokell <https://serokell.io>
#
# SPDX-License-Identifier: MPL-2.0

.PHONY: all build test haddock haddock-no-deps clean

all:
	$(MAKE) build
	$(MAKE) test

build:
	stack build

test:

haddock:
	stack haddock --open

haddock-no-deps:
	stack exec haddock-no-deps --open

clean:
	stack clean
