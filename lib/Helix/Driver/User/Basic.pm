package Helix::Driver::User::Basic;
# ==============================================================================
#
#   Helix Framework
#   Copyright (c) 2009, Atma 7
#   ---
#   Helix/Driver/User/Basic.pm - basic user driver
#
# ==============================================================================

use base qw/Helix::Driver::User/;
use warnings;
use strict;

our $VERSION  = "0.02"; # 2009-04-06 02:04:33

# ------------------------------------------------------------------------------
# authorize($login)
# authorize user
# ------------------------------------------------------------------------------
sub authorize
{
    my ($self, $login, $r);

    ($self, $login) = @_;
    $r = Helix::Core::Registry->get_instance;

    $r->cgi->start_session;
    $r->cgi->set_session("login", $login);
    $r->cgi->set_session("ip",    $self->ip);

    __PACKAGE__->mk_accessors("login");
    $self->login( $login );
}

# ------------------------------------------------------------------------------
# unauthorize()
# unauthorize user
# ------------------------------------------------------------------------------
sub unauthorize
{
    my ($self, $r);

    $self = shift;
    $r    = Helix::Core::Reigstry->get_instance;

    $r->cgi->destroy_session;
    $self->login( undef );
}

# ------------------------------------------------------------------------------
# $ authorized()
# check if user is authorized
# ------------------------------------------------------------------------------
sub authorized
{
    my ($self, $r);

    $self = shift;
    $r    = Helix::Core::Registry->get_instance;

    return $r->cgi->get_session("login") && ($r->cgi->get_session("ip") eq $self->ip);
}

1;

__END__

=head1 NAME

Helix::Driver::User::Basic - Helix Framework basic user driver.

=head1 SYNOPSIS

Login handler:

    my ($r, $user, $login, $pass);

    $r     = Helix::Core::Registry->get_instance;
    $user  = $r->loader->get_object("Helix::Driver::User::Basic");
    
    if (!$user->authorized)
    {
        $login = $r->cgi->post("login");
        $pass  = $r->cgi->post("password");

        # login & password validation
        # ...

        $user->authorize($login) if ($login_and_password_are_valid);
    }

Logout handler:

    my ($r, $user);

    $r    = Helix::Core::Registry->get_instance;
    $user = $r->loader->get_object("Helix::Driver::User::Basic");

    $user->unauthorize;

=head1 DESCRIPTION

The I<Helix::Driver::User::Basic> is a user driver for I<Helix Framework>, that
provides simple session-based authorization.

=head1 METHODS

=head2 new()

Inherited from L<Helix::Driver::User/new()>.

=head2 authorize($login)

Implementation of abstract method from L<Helix::Driver::User/authorize($login)>.

=head2 unauthorize()

Implementation of abstract method from L<Helix::Driver::User/unauthorize()>.

=head2 authorized()

Implementation of abstract method from L<Helix::Driver::User/authorized()>.

=head1 ATTRIBUTES

The I<Helix::Driver::User::Basic> package adds one useful class 
attribute that is filled in during user authorization. See
L<Helix::Driver::User/ATTRIBUTES> for more information about using user driver 
class attributes.

=head2 agent

Inherited from L<Helix::Driver::User/agent>.

=head2 ip

Inherited from L<Helix::Driver::User/ip>.

=head2 language

Inherited from L<Helix::Driver::User/language>.

=head2 referer

Inherited from L<Helix::Driver::User/referer>.

=head2 login

User login. Contains information only if user was authorized before, I<undef>
otherwise.

=head1 SEE ALSO

L<Helix>, L<Helix::Driver::User>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Anton Belousov, E<lt>abel@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright (c) 2009, Atma 7, L<http://www.atma7.com>

=cut
