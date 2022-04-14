#!/usr/bin/env raku
use Test;
use Base58;

plan 8;

# test vectors from https://www.ietf.org/archive/id/draft-msporny-base58-03.txt
#
for "Hello World!" => '2NEpo7TZRRrLZSi2U',
    "The quick brown fox jumps over the lazy dog." => 'USm3fpXnKG5EUBx2ndxBDMPVciP5hGey2Jh4NDv6gmeo1LkMeiKrLJUUBk6Z',
    blob8.new('0000287fb4cd'.comb(/../).map({:16($_)})) => '11233QC4' {
   
  is Base58::encode(.key), .value;
  is Base58::decode(.value), .key ~~ Str ?? .key.encode !! .key;
}

dies-ok { Base58::decode "foo bar" };
dies-ok { Base58::decode "1l" };

# vi: ft=raku
