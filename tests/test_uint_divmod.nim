# Stint
# Copyright 2018 Status Research & Development GmbH
# Licensed under either of
#
#  * Apache License, version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
#  * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
#
# at your option. This file may not be copied, modified, or distributed except according to those terms.

import ../stint, unittest, test_helpers

template chkDiv(chk: untyped, a, b, c: string, bits: int) =
  chk (fromHex(Stuint[bits], a) div fromHex(Stuint[bits], b)) == fromHex(Stuint[bits], c)

template chkMod(chk: untyped, a, b, c: string, bits: int) =
  chk (fromHex(Stuint[bits], a) mod fromHex(Stuint[bits], b)) == fromHex(Stuint[bits], c)

template chkDivMod(chk: untyped, a, b, c, d: string, bits: int) =
  chk divmod(fromHex(Stuint[bits], a), fromHex(Stuint[bits], b)) == (fromHex(Stuint[bits], c), fromHex(Stuint[bits], d))

template testdivmod(chk, tst: untyped) =
  tst "operator `div`":
    chkDiv(chk, "0", "3", "0", 8)
    chkDiv(chk, "1", "3", "0", 8)
    chkDiv(chk, "3", "3", "1", 8)
    chkDiv(chk, "3", "1", "3", 8)
    chkDiv(chk, "FF", "3", "55", 8)

    chkDiv(chk, "0", "3", "0", 16)
    chkDiv(chk, "1", "3", "0", 16)
    chkDiv(chk, "3", "3", "1", 16)
    chkDiv(chk, "3", "1", "3", 16)
    chkDiv(chk, "FF", "3", "55", 16)
    chkDiv(chk, "FFFF", "3", "5555", 16)

    chkDiv(chk, "0", "3", "0", 32)
    chkDiv(chk, "1", "3", "0", 32)
    chkDiv(chk, "3", "3", "1", 32)
    chkDiv(chk, "3", "1", "3", 32)
    chkDiv(chk, "FF", "3", "55", 32)
    chkDiv(chk, "FFFF", "3", "5555", 32)
    chkDiv(chk, "FFFFFFFF", "3", "55555555", 32)

    chkDiv(chk, "0", "3", "0", 64)
    chkDiv(chk, "1", "3", "0", 64)
    chkDiv(chk, "3", "3", "1", 64)
    chkDiv(chk, "3", "1", "3", 64)
    chkDiv(chk, "FF", "3", "55", 64)
    chkDiv(chk, "FFFF", "3", "5555", 64)
    chkDiv(chk, "FFFFFFFF", "3", "55555555", 64)
    chkDiv(chk, "FFFFFFFFFFFFFFFF", "3", "5555555555555555", 64)

    chkDiv(chk, "0", "3", "0", 128)
    chkDiv(chk, "1", "3", "0", 128)
    chkDiv(chk, "3", "3", "1", 128)
    chkDiv(chk, "3", "1", "3", 128)
    chkDiv(chk, "FF", "3", "55", 128)
    chkDiv(chk, "FFFF", "3", "5555", 128)
    chkDiv(chk, "FFFFFFFF", "3", "55555555", 128)
    chkDiv(chk, "FFFFFFFFFFFFFFFF", "3", "5555555555555555", 128)
    chkDiv(chk, "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", "3", "55555555555555555555555555555555", 128)

  tst "operator `mod`":
    chkMod(chk, "0", "3", "0", 8)
    chkMod(chk, "1", "3", "1", 8)
    chkMod(chk, "3", "3", "0", 8)
    chkMod(chk, "3", "1", "0", 8)
    chkMod(chk, "FF", "3", "0", 8)
    chkMod(chk, "FF", "4", "3", 8)

    chkMod(chk, "0", "3", "0", 16)
    chkMod(chk, "1", "3", "1", 16)
    chkMod(chk, "3", "3", "0", 16)
    chkMod(chk, "3", "1", "0", 16)
    chkMod(chk, "FF", "3", "0", 16)
    chkMod(chk, "FF", "4", "3", 16)
    chkMod(chk, "FFFF", "3", "0", 16)
    chkMod(chk, "FFFF", "4", "3", 16)
    chkMod(chk, "FFFF", "17", "8", 16)

    chkMod(chk, "0", "3", "0", 32)
    chkMod(chk, "1", "3", "1", 32)
    chkMod(chk, "3", "3", "0", 32)
    chkMod(chk, "3", "1", "0", 32)
    chkMod(chk, "FF", "3", "0", 32)
    chkMod(chk, "FF", "4", "3", 32)
    chkMod(chk, "FFFF", "3", "0", 32)
    chkMod(chk, "FFFF", "17", "8", 32)
    chkMod(chk, "FFFFFFFF", "3", "0", 32)
    chkMod(chk, "FFFFFFFF", "23", "A", 32)
    chkMod(chk, "FFFFFFFF", "27", "15", 32)

    chkMod(chk, "0", "3", "0", 64)
    chkMod(chk, "1", "3", "1", 64)
    chkMod(chk, "3", "3", "0", 64)
    chkMod(chk, "3", "1", "0", 64)
    chkMod(chk, "FF", "3", "0", 64)
    chkMod(chk, "FF", "4", "3", 64)
    chkMod(chk, "FFFF", "3", "0", 64)
    chkMod(chk, "FFFF", "17", "8", 64)
    chkMod(chk, "FFFFFFFF", "3", "0", 64)
    chkMod(chk, "FFFFFFFF", "23", "A", 64)
    chkMod(chk, "FFFFFFFF", "27", "15", 64)
    chkMod(chk, "FFFFFFFFFFFFFFFF", "27", "F", 64)

    chkMod(chk, "0", "3", "0", 128)
    chkMod(chk, "1", "3", "1", 128)
    chkMod(chk, "3", "3", "0", 128)
    chkMod(chk, "3", "1", "0", 128)
    chkMod(chk, "FF", "3", "0", 128)
    chkMod(chk, "FF", "4", "3", 128)
    chkMod(chk, "FFFF", "3", "0", 128)
    chkMod(chk, "FFFF", "17", "8", 128)
    chkMod(chk, "FFFFFFFF", "3", "0", 128)
    chkMod(chk, "FFFFFFFF", "23", "A", 128)
    chkMod(chk, "FFFFFFFF", "27", "15", 128)
    chkMod(chk, "FFFFFFFFFFFFFFFF", "27", "F", 128)
    chkMod(chk, "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", "27", "15", 128)

  tst "operator `divmod`":
    chkDivMod(chk, "0", "3", "0", "0", 8)
    chkDivMod(chk, "1", "3", "0", "1", 8)
    chkDivMod(chk, "3", "3", "1", "0", 8)
    chkDivMod(chk, "3", "1", "3", "0", 8)
    chkDivMod(chk, "FF", "3", "55", "0", 8)
    chkDivMod(chk, "FF", "4", "3F", "3", 8)

    chkDivMod(chk, "0", "3", "0", "0", 16)
    chkDivMod(chk, "1", "3", "0", "1", 16)
    chkDivMod(chk, "3", "3", "1", "0", 16)
    chkDivMod(chk, "3", "1", "3", "0", 16)
    chkDivMod(chk, "FF", "3", "55", "0", 16)
    chkDivMod(chk, "FF", "4", "3F", "3", 16)
    chkDivMod(chk, "FFFF", "3", "5555", "0", 16)
    chkDivMod(chk, "FFFF", "4", "3FFF", "3", 16)
    chkDivMod(chk, "FFFF", "17", "B21", "8", 16)

    chkDivMod(chk, "0", "3", "0", "0", 32)
    chkDivMod(chk, "1", "3", "0", "1", 32)
    chkDivMod(chk, "3", "3", "1", "0", 32)
    chkDivMod(chk, "3", "1", "3", "0", 32)
    chkDivMod(chk, "FF", "3", "55", "0", 32)
    chkDivMod(chk, "FF", "4", "3F", "3", 32)
    chkDivMod(chk, "FFFF", "3", "5555", "0", 32)
    chkDivMod(chk, "FFFF", "17", "B21", "8", 32)
    chkDivMod(chk, "FFFFFFFF", "3", "55555555", "0", 32)
    chkDivMod(chk, "FFFFFFFF", "23", "7507507", "0A", 32)
    chkDivMod(chk, "FFFFFFFF", "27", "6906906", "15", 32)

    chkDivMod(chk, "0", "3", "0", "0", 64)
    chkDivMod(chk, "1", "3", "0", "1", 64)
    chkDivMod(chk, "3", "3", "1", "0", 64)
    chkDivMod(chk, "3", "1", "3", "0", 64)
    chkDivMod(chk, "FF", "3", "55", "0", 64)
    chkDivMod(chk, "FF", "4", "3F", "3", 64)
    chkDivMod(chk, "FFFF", "3", "5555", "0", 64)
    chkDivMod(chk, "FFFF", "17", "B21", "8", 64)
    chkDivMod(chk, "FFFFFFFF", "3", "55555555", "0", 64)
    chkDivMod(chk, "FFFFFFFF", "23", "7507507", "0A", 64)
    chkDivMod(chk, "FFFFFFFF", "27", "6906906", "15", 64)
    chkDivMod(chk, "FFFFFFFFFFFFFFFF", "27", "690690690690690", "F", 64)

    chkDivMod(chk, "0", "3", "0", "0", 128)
    chkDivMod(chk, "1", "3", "0", "1", 128)
    chkDivMod(chk, "3", "3", "1", "0", 128)
    chkDivMod(chk, "3", "1", "3", "0", 128)
    chkDivMod(chk, "FF", "3", "55", "0", 128)
    chkDivMod(chk, "FF", "4", "3F", "3", 128)
    chkDivMod(chk, "FFFF", "3", "5555", "0", 128)
    chkDivMod(chk, "FFFF", "17", "B21", "8", 128)
    chkDivMod(chk, "FFFFFFFF", "3", "55555555", "0", 128)
    chkDivMod(chk, "FFFFFFFF", "23", "7507507", "0A", 128)
    chkDivMod(chk, "FFFFFFFF", "27", "6906906", "15", 128)
    chkDivMod(chk, "FFFFFFFFFFFFFFFF", "27", "690690690690690", "F", 128)
    chkDivMod(chk, "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", "27", "6906906906906906906906906906906", "15", 128)

static:
  testdivmod(ctCheck, ctTest)

suite "Wider unsigned int muldiv coverage":
  testdivmod(check, test)

suite "Testing unsigned int division and modulo implementation":
  test "Divmod(100, 13) returns the correct result":

    let a = 100.stuint(64)
    let b = 13.stuint(64)
    let qr = divmod(a, b)

    check: cast[uint64](qr.quot) == 7'u64
    check: cast[uint64](qr.rem)  == 9'u64

  test "Divmod(2^64, 3) returns the correct result":
    let a = 1.stuint(128) shl 64
    let b = 3.stuint(128)

    let qr = divmod(a, b)

    let q = cast[UintImpl[uint64]](qr.quot)
    let r = cast[UintImpl[uint64]](qr.rem)

    check: q.lo == 6148914691236517205'u64
    check: q.hi == 0'u64
    check: r.lo == 1'u64
    check: r.hi == 0'u64

  test "Divmod(1234567891234567890, 10) returns the correct result":
    let a = cast[StUint[64]](1234567891234567890'u64)
    let b = cast[StUint[64]](10'u64)

    let qr = divmod(a, b)

    let q = cast[uint64](qr.quot)
    let r = cast[uint64](qr.rem)

    check: q == 123456789123456789'u64
    check: r == 0'u64

suite "Testing specific failures highlighted by property-based testing":
  test "Modulo: 65696211516342324 mod 174261910798982":

    let u = 65696211516342324'u64
    let v = 174261910798982'u64

    let a = cast[Stuint[64]](u)
    let b = cast[Stuint[64]](v)

    let z = u mod v
    let tz = cast[uint64](a mod b)

    check: z == tz

  test "Modulo: 15080397990160655 mod 600432699691":
    let u = 15080397990160655'u64
    let v = 600432699691'u64

    let a = cast[Stuint[64]](u)
    let b = cast[Stuint[64]](v)

    let z = u mod v
    let tz = cast[uint64](a mod b)

    check: z == tz
