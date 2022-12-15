# Calling convention

Callee cleans up the stack

## Return-value

Return value is stored in `a`, `x` or in the beginning of stack space
which has to allocated by the caller. Esentially one of the stack arguments will get overwritten
with the return value.

## Caller-saves

`a`, `b`, `x`, `y`

### Arguments

- `a`
- `x`
- `b`
- rest on stack pushed in order

## Callee-saves

`c`, `z`, `s`
