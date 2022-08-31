#!/usr/bin/env raku
use Test;
use Base58;

subtest "https://www.ietf.org/archive/id/draft-msporny-base58-03.txt", {
  for "Hello World!" => '2NEpo7TZRRrLZSi2U',
    "The quick brown fox jumps over the lazy dog." => 'USm3fpXnKG5EUBx2ndxBDMPVciP5hGey2Jh4NDv6gmeo1LkMeiKrLJUUBk6Z',
      blob8.new('0000287fb4cd'.comb(/../).map({:16($_)})) => '11233QC4' {

	is Base58::encode(.key), .value;
	is Base58::decode(.value), .key ~~ Str ?? .key.encode !! .key;
      }
}

subtest "exceptions", {
  for "foo bar", "1l" {
    dies-ok { Base58::decode $_ }, "Base58::decode('$_') dies as expected";
  }
}

subtest "testing random blobs", {

  for ^10 {
    my $b = blob8.new: ^256 .roll(32);
    my $s = Base58::encode $b;
    is $b, Base58::decode($s), $s;
  }

}

done-testing;
# vi: ft=raku
