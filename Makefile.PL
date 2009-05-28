#!/usr/bin/perl
# ==============================================================================
#
#   Helix Framework
#   Copyright (c) 2009, Atma 7
#   ---
#   Makefile.PL - makefile maker
#
# ==============================================================================  

use 5.008008;
use ExtUtils::MakeMaker;
use warnings;
use strict;

WriteMakefile
(
    "NAME"          => "Helix::Driver::User::Basic",
    "ABSTRACT_FROM" => "lib/Helix/Driver/User/Basic.pm",
    "VERSION_FROM"  => "lib/Helix/Driver/User/Basic.pm", 
    "AUTHOR"        => "Anton Belousov <abel\@cpan.org>",

    "PREREQ_PM"     => 
    {
        "Helix" => "0.02"
    }, 

    "test"          => { "TESTS" => "t/*.t" },
);

