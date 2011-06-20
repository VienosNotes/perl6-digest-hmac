use v6;
use Test;
use Digest::SHA1::TMP;

my $sha1 = Digest::SHA1::TMP.new;
is $sha1.add("hoge\nhoge").hexdigest, "6d82bc770b2e0ba418e7bd57e44b33341db4946d  -", "Test of hexdigest() with a simple string";

done;