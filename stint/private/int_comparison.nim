# Stint
# Copyright 2018 Status Research & Development GmbH
# Licensed under either of
#
#  * Apache License, version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
#  * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
#
# at your option. This file may not be copied, modified, or distributed except according to those terms.

import  ./datatypes, ./bithacks, ./as_words, ./as_signed_words,
        ./bithacks

func isZero*(n: SomeSignedInt): bool {.inline.} =
  n == 0

func isZero*(n: IntImpl): bool {.inline.} =
  asWords(n, ignoreEndianness = true):
    if n != 0:
      return false
  return true

func isNegative*(n: IntImpl): bool {.inline.} =
  ## Returns true if a number is negative:
  n.msb.bool

func `<`*(x, y: IntImpl): bool {.inline.}=
  # Lower comparison for multi-precision integers
  asSignedWordsZip(x, y):
    if x != y:
      return x < y
  return false # they're equal

func `==`*(x, y: IntImpl): bool {.inline.}=
  # Equal comparison for multi-precision integers
  asWordsZip(x, y, ignoreEndianness = true):
    if x != y:
      return false
  return true # they're equal

func `<=`*(x, y: IntImpl): bool {.inline.}=
  # Lower or equal comparison for multi-precision integers
  asSignedWordsZip(x, y):
    if x != y:
      return x < y
  return true # they're equal

func isOdd*(x: IntImpl): bool {.inline.}=
  bool(x.least_significant_word and 1)

func isEven*(x: IntImpl): bool {.inline.}=
  not x.isOdd
