package PerlIO::via::as_is;

# DATE
# VERSION

sub PUSHED {
    my ($class, $mode, $fh) = @_;
    bless [], $class;
}

sub FILL {
    my ($self, $fh) = @_;
    <$fh>;
}

sub WRITE {
    my ($self, $buffer, $fh) = @_;
    if (print $fh $buffer) { length($buffer) } else { -1 }
}

1;
# ABSTRACT: PerlIO layer that passes everything as-is

=for Pod::Coverage ^(FILL|PUSHED|WRITE)$

=head1 SYNOPSIS

Reading:

 use PerlIO::via::as_is;
 open my($fh), "<:via(as_is)", "file";
 print while <$fh>;

Writing:

 open my($fh), ">:via(as_is)", "file";
 print $fh "one", "two\n";


=head1 DESCRIPTION

This PerlIO layer does nothing (reads/writes everything as-is). Created for
testing purpose.


=head1 SEE ALSO

L<PerlIO::via>
