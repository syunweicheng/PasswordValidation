#!/usr/bin/perl

use strict;
use warnings;

sub passwordValidate {
    my $userPassword = shift; 
    my $validation = qr/
        \A(?=.{20,}\z)|
        \A(?=.{16,}\z)(?=[^a-z]*[a-z])(?=[^A-Z]*[A-Z])|
        \A(?=.{12,}\z)(?=[^a-z]*[a-z])(?=[^A-Z]*[A-Z])(?=[\D]*[\d])|
        \A(?=.{8,}\z)(?=[^a-z]*[a-z])(?=[^A-Z]*[A-Z])(?=[\D]*[\d])(?=[\w]*[\W\_])
    /x;
    return $userPassword =~ m/$validation/g;
}
eval {
    # my @failed_password = ('abcEF123456','8liX=F', '#/@{[-<<', '*-2)%.|&', '2]0g"\*t', 'W)!559(*', 'C%J)F."?}T+S', '%/zbe}v,mljv', 'bdoqlixsrqxpqpmu');
    my @passed_password = ('MTt{2s.X', 'zBqR88KUnDf6', 'asdRincvBLSzWYgt', 'WmBe87;G6Y{Pr-8HFpQ', '...@...._...........','bdoqsslixsrqxpqpmuss');
    foreach my $password (@passed_password) {
        # print length($password);
        print passwordValidate($password) ? "Passed\n" : "Failed\n";
    }
};
print $@ if $@
