use v6;

class Digest::SHA1::TMP:auth<vieno>:version<0.1> {

    has Str $.sha_name;
    has Str $.data;

    method new (Str $sha_name?) {

        my Str $tmp;
        if $sha_name.defined {
            $tmp = $sha_name;
        }
        else {
            $tmp = $*OS eq "darwin" ?? "shasum5.10.0" !! "sha1sum";
        }

        self.bless(*, sha_name => $tmp);
    }

    method add ($data as Str) {
        $!data ~= $data;
        return self;
    }

    method addfile (Str $filename) {

        $filename.f or die "No such a file.\n";

        my IO $file = open $filename;
        $!data ~= $file.slurp;
        $file.close;

        return self;
    }

    method hexdigest returns Str {
        return qqx{ $!sha_name <<EOF\n$!data\nEOF\n}.chomp;
    }
}

