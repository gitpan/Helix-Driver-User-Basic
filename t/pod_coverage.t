#!/usr/bin/perl
# ==============================================================================
#
#   Helix Framework
#   Copyright (c) 2009, Atma 7
#   ---
#   t/pod_coverage.t - POD coverage tests
#
# ==============================================================================  

use Test::More;
use warnings;
use strict;

eval "use Test::Pod::Coverage";
plan skip_all => "Test::Pod::Coverage required" if $@;
plan skip_all => "set HELIX_DEVEL environment variable to enable this test" unless $ENV{"HELIX_DEVEL"};

all_pod_coverage_ok();

