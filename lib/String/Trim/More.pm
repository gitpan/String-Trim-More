package String::Trim::More;

our $DATE = '2014-12-10'; # DATE
our $VERSION = '0.01'; # VERSION

use 5.010001;
use strict;
use warnings;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       ltrim
                       rtrim
                       trim
                       ltrim_lines
                       rtrim_lines
                       trim_lines
                       trim_blank_lines
               );

sub ltrim {
    my $str = shift;
    $str =~ s/\A\s+//s;
    $str;
}

sub rtrim {
    my $str = shift;
    $str =~ s/\s+\z//s;
    $str;
}

sub trim {
    my $str = shift;
    $str =~ s/\A\s+//s;
    $str =~ s/\s+\z//s;
    $str;
}

sub ltrim_lines {
    my $str = shift;
    $str =~ s/^[ \t]+//mg; # XXX other unicode non-newline spaces
    $str;
}

sub rtrim_lines {
    my $str = shift;
    $str =~ s/[ \t]+$//mg;
    $str;
}

sub trim_lines {
    my $str = shift;
    $str =~ s/^[ \t]+//mg;
    $str =~ s/[ \t]+$//mg;
    $str;
}

sub trim_blank_lines {
    local $_ = shift;
    return $_ unless defined;
    s/\A(?:\n\s*)+//;
    s/(?:\n\s*){2,}\z/\n/;
    $_;
}

1;
# ABSTRACT: Various string trimming utilities

__END__

=pod

=encoding UTF-8

=head1 NAME

String::Trim::More - Various string trimming utilities

=head1 VERSION

This document describes version 0.01 of String::Trim::More (from Perl distribution String-Trim-More), released on 2014-12-10.

=head1 DESCRIPTION

This is an alternative to L<String::Trim> (and similar modules, see L</"SEE
ALSO">). Instead of a single C<trim> function, this module provides several from
which you can choose on, depending on your needs.

=head1 FUNCTIONS

=head2 ltrim($str) => STR

Trim whitespaces (including newlines) at the beginning of string. Equivalent to:

 $str =~ s/\A\s+//s;

=head2 ltrim_lines($str) => STR

Trim whitespaces (not including newlines) at the beginning of each line of
string. Equivalent to:

 $str =~ s/^\s+//mg;

=head2 rtrim($str) => STR

Trim whitespaces (including newlines) at the end of string. Equivalent to:

 $str =~ s/[ \t]+\z//s;

=head2 rtrim_lines($str) => STR

Trim whitespaces (not including newlines) at the end of each line of
string. Equivalent to:

 $str =~ s/[ \t]+$//mg;

=head2 trim($str) => STR

ltrim + rtrim.

=head2 trim_lines($str) => STR

ltrim_lines + rtrim_lines.

=head2 trim_blank_lines($str) => STR

Trim blank lines at the beginning and the end. Won't trim blank lines in the
middle. Blank lines include lines with only whitespaces in them.

=head1 SEE ALSO

L<String::Trim>, L<Text::Trim>, L<String::Strip>, L<String::Util>.

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/String-Trim-More>.

=head1 SOURCE

Source repository is at L<https://github.com/perlancar/perl-String-Trim-More>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=String-Trim-More>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
