[![SparrowCI](https://ci.sparrowhub.io/project/gh-grondilu-base58-raku/badge)](https://ci.sparrowhub.io)
# Base58

Satoshi Nakamoto's binary-to-text encoding in Raku.  No checksum.

## Synopis

```raku
use Base58;

say Base58::encode "Hello World!";      # 2NEpo7TZRRrLZSi2U
say Base58::decode "2NEpo7TZRRrLZSi2U"; # Blob[uint8]:0x<48 65 6C 6C 6F 20 57 6F 72 6C 64 21>

say Base58::encode blob8.new: ^10; # 1kA3B2yGe2z4
```
