# bytecurry.hash

bytecurry.hash is a collection of utilities and helpers for working with hash-tables.

All symbols are exported in the bytecurry.hash package, which is aliased as bhash.

# API

## Concurrency

### WITH-LOCKED-HASH-TABLE (table) &body body

This is a portable version of `WITH-LOCKED-HASH-TABLE`. It execute body with an
exclusive lock on `TABLE`.

On SBCL it is just an alias `SB-EXT:WITH-LOCKED-HASH-TABLE` and on lispworks
it just wraps `HCL:WITH-HASH-TABLE-LOCKED`. On other implementations it uses a
monitor lock for the table (specifically using `SERAPEUM:SYNCHRONIZED`).

## Syntax

bytecurry.hash also provides a reader macro for hash tables, and an associated print function.

It defines a dispatch macro under hash for `#\H` followed by a plist containing the pairs to
store in the hash table.
