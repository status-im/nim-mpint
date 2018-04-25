# Stint (Stack-based multiprecision integers)

[![Build Status (Travis)](https://img.shields.io/travis/status-im/stint/master.svg?label=Linux%20/%20macOS "Linux/macOS build status (Travis)")](https://travis-ci.org/status-im/stint)
[![License: Apache](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Stability: experimental](https://img.shields.io/badge/stability-experimental-orange.svg)

A fast and portable stack-based multi-precision integer library in pure Nim

Main focus:
  - Portability
    - 32 and 64 bit arch
    - ARM for usage on mobile phones
    - Additionally RISC-V and MIPS for open hardware and low power IoT devices.
  - Speed, library is carefully tuned to produce the best assembly given the current compilers.
    However, the library itself does not resort to assembly for portability.
  - No heap/dynamic allocation
  - Ethereum applications
    - Uint256/Int256 for Ethereum Virtual Machine usage.
    - Uint2048 for Ethereum Bloom filters
  - Ease of use:
    - Use traditional `+`, `-`, `+=`, etc operators like on native types
    - Representation of numbers in memory is the exact same as native types and endianness aware.
      - In practice that means that interfacing with binary blobs representing numbers from cryptographic    libraries can be done with a `cast` if it represents a Uint256, Uint512, Uint1024, Uint2048.
    - converting to and from Hex
    - converting to and from decimal strings

## License

Licensed under either of

 * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
 * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.
