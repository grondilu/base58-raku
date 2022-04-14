#!/usr/bin/env raku
unit module Base58;

our constant @alphabet = <
    1 2 3 4 5 6 7 8 9
  A B C D E F G H   J K L M N   P Q R S T U V W X Y Z
  a b c d e f g h i j k   m n o p q r s t u v w x y z
>;

our subset Base58Str of Str is export where /^<@alphabet>*$/;

our proto encode($ --> Base58Str) {*}
multi encode(Str $s) { samewith($s.encode) }
multi encode(blob8 $b) {
  return 
    ($b.map(+(* == 0)).join.match(/^1*/)) ~
    $b
    .Array
    .reduce(256 * * + *)
    .polymod(58 xx *)
    .reverse
    .map({@alphabet[$_]})
    .join;
}

our sub decode(Base58Str $s where /^<@alphabet>*$/ --> blob8) {
  my %b58 = @alphabet Z=> ^58;
  return blob8.new:
    0 xx $s.match(/^1*/).chars,
    |$s.comb.map({%b58{$_}})
    .reduce(58 * * + *)
    .polymod(256 xx *)
    .reverse
  ;
}
