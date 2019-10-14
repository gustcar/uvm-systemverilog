# Verification Test Plan

## Project Dual-Ported RAM

### Scenarios

- Simple read to an address
- Simple write to an address
- Several reads and writes to the same address and different addresses
- Simultaneous read and write to different addresses
- Simultaneous read and write to the same address
- Memory access with different addresses and data patterns
  - all zeros
  - all ones
  - alternated ones and zeros
  - other one/zeros patterns
- Reads followed by writes to same and different addresses with different delays
- Writes followed by reads to same and different addresses with different delays
- The boundaries of the memory with read and writes

