# Calling convention

Callee cleans up the stack

## Return-value

Return value is stored in `r1` or in the beginning of stack space
which has to allocated by the caller. Esentially one of the stack arguments will get overwritten
with the return value.

## Caller-saves

`r1`, `r6`, `r7`, `r8`, `r9`

### Arguments

- `r6`
- `r7`
- `r8`
- `r9`
- rest on stack pushed in order

## Callee-saves

`r2`, `r3`, `r4`, `r5`, `r10`, `rs`, `rl`, `rf`
