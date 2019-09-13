#!/usr/bin/perl

use strict;
use warnings;

sub passwordValidate {
    my $userPassword = shift;             #Get input arguments: password 
    my $len = length($userPassword);      #Password length
    my $PASS = 1;                         #return 1 when pass
    # print $len;

    #regular expression patterns
    my $mix_cases_pat = qr/([A-Z].*[a-z])|([a-z].*[A-Z])/x; # Mixed cases pattern
    my $numbers_pat = qr/[0-9]/x;                           # Numbers pattern  
    my $symboss_pat = qr/[^\d\w]|\_/x;                      # Symbols pattern

    return $PASS if $len >= 20;                                     # >= 20: Any character desired.
    return !$PASS if $len < 8;                                     # <  8: At least 8 Length.
    return !$PASS if !($userPassword =~ $mix_cases_pat);            #Failed: Not containes mied cased characters.
    return !$PASS if !($userPassword =~ $numbers_pat) && $len < 16; #Failed: Not containes numbers if len < 16.
    return !$PASS if !($userPassword =~ $symboss_pat) && $len < 12; #Failed: Not containes symbs if len < 12.
    return $PASS
}
eval {
    my @failed_password = ('8liX=F', '#/@{[-<<', '*-2)%.|&', '2]0g"\*t', 'W)!559(*', 'C%J)F."?}T+S', '%/zbe}v,mljv', 'bdoqlixsrqxpqpmu');
    my @passed_password = ('MTt{2s.X', 'zBqR88KUnDf6', 'asdRincvBLSzWYgt', 'WmBe87;G6Y{Pr-8HFpQ');

    foreach my $password (@passed_password) {
        print passwordValidate($password) ? "Passed\n" : "Failed\n";
    }
};
print $@ if $@
