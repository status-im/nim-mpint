# Stint
# Copyright 2018 Status Research & Development GmbH
# Licensed under either of
#
#  * Apache License, version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
#  * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
#
# at your option. This file may not be copied, modified, or distributed except according to those terms.

import  ./uint_public, ./int_public, ./io
export  uint_public, int_public, io

type
  Int128* = Stint[128]
  Int256* = Stint[256]
  UInt128* = StUint[128]
  UInt256* = StUint[256]

template make_conv(conv_name: untyped, size: int): untyped =
  func `convname`*(n: SomeInteger): StUint[size] {.inline.}=
    n.stuint(size)
  func `convname`*(input: string): StUint[size] {.inline.}=
    parse(Stuint[size], input)

make_conv(u128, 128)
make_conv(u256, 256)

template make_conv(conv_name: untyped, size: int): untyped =
  func `convname`*(n: SomeInteger): Stint[size] {.inline.}=
    n.stint(size)
  func `convname`*(input: string): Stint[size] {.inline.}=
    parse(Stint[size], input)

make_conv(i128, 128)
make_conv(i256, 256)
