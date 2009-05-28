#!/usr/bin/perl
# ==============================================================================
#
#   Helix Framework
#   Copyright (c) 2009, Atma 7
#   ---
#   t/main.t - basic user driver tests
#
# ==============================================================================  

use Test::More tests => 6;
use warnings;
use strict;

# ------------------------------------------------------------------------------
# BEGIN()
# test initialization
# ------------------------------------------------------------------------------
BEGIN
{
    use_ok("Helix::Driver::Exceptions");
    use_ok("Helix::Driver::User");
    use_ok("Helix::Driver::User::Basic");
}

# methods
ok( Helix::Driver::User::Basic->can("authorize"),   "authorize method"   );
ok( Helix::Driver::User::Basic->can("unauthorize"), "unauthorize method" );
ok( Helix::Driver::User::Basic->can("authorized"),  "authorized method"  );

