package Tees::App::Schema::Result::User;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table( 'user' );
__PACKAGE__->add_columns(
    "userid",
    {
        data_type => 'integer',
        is_auto_increment => 1,
        is_nullable => 0,
    },
    "login",
    {
        data_type => 'string',
        is_nullable => 0,
    },
    "passwd",
    {
        data_type => 'string',
        is_nullable => 0,
    },
    "privilege",
    {
        data_type => 'integer',
        is_nullable => 1,
    },
);

__PACKAGE__->set_primary_key( 'userid' );
__PACKAGE__->has_many( items => App::Schema::Result::Item, 'userid' );

1;
