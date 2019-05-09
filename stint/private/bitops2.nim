# Stint
# Copyright 2018 Status Research & Development GmbH
# Licensed under either of
#
#  * Apache License, version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
#  * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
#
# at your option. This file may not be copied, modified, or distributed except according to those terms.

import  ./datatypes, ./conversion, std_shims/support/bitops2
export bitops2

# Bitops from support library

func countOnes*(x: UintImpl): int {.inline.} =
  countOnes(x.lo) + countOnes(x.hi)

func parity*(x: UintImpl): int {.inline.} =
  parity(x.lo) xor parity(x.hi)

func leadingZeros*(x: UintImpl): int {.inline.} =
  let tmp = x.hi.leadingZeros()
  if tmp == bitsof(x.hi):
    x.lo.leadingZeros() + bitsof(x.hi)
  else:
    tmp

func trailingZeros*(x: UintImpl): int {.inline.} =
  let tmp = x.lo.trailingZeros()
  if tmp == bitsof(x.lo):
    tmp + x.hi.trailingZeros()
  else:
    tmp

func firstOne*(x: UintImpl): int {.inline.} =
  let tmp = trailingZeros(x)
  if tmp == bitsof(x):
    0
  else:
    1 + tmp
