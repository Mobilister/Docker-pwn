## Docker for CTF-challanges and reverse-engineering

### Debugging and Reverse Engineering Tools
- GDB, GDB-multiarch: GNU debugger with support for multiple architectures.
- Radare2: Comprehensive framework for reverse engineering.
- Pwndbg: Enhancement for GDB, aids in exploit development and reverse engineering.
- Pwngdb: Additional GDB configuration specifically tailored for pwn tasks.
### Security Analysis and Exploitation Tools
- One_gadget: Tool for finding one-gadget RCE (remote code execution) in binaries.
- Seccomp-tools: Utilities for dealing with seccomp filters.
- ROPgadget: Tool to find ROP gadgets in binaries.
- Ropper: Another tool for finding and analyzing ROP gadgets.
### Binary Analysis Frameworks
- Z3-solver: High-performance theorem prover.
- Unicorn: CPU emulator framework for writing tests and executing binary code.
- Keystone-engine: Lightweight multi-platform, multi-architecture assembler framework.
- Capstone: Disassembly/disassembler framework supporting multiple architectures.
- Angr: Python framework for analyzing binaries, capable of static and dynamic binary analysis.
- r2pipe: Scripting library for interfacing with Radare2 from Python.

## Build and run

Build and run 
```
docker-compose up -d
```
Login 
```
docker run -it pwn-docker_pwn
```
