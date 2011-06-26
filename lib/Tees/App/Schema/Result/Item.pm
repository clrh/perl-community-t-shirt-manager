package Tees::App::Schema::Result::Item;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table( 'item' );
__PACKAGE__->add_columns(
    'itemid',
    {
        data_type => 'integer',
        is_auto_increment => 1,
        is_nullable => 0,
    },
    'userid',
    {
        data_type => 'integer',
        is_nullable => 0,
    },
    'color',
    {
        data_type => 'string',
        is_nullable => 1,
    },
    'date',
    {
        data_type => 'string',
        is_nullable => 1,
    },
);

__PACKAGE__->set_primary_key( 'itemid' );
__PACKAGE__->has_many( images => 'Tees::App::Schema::Result::Image', 'imageid' );
__PACKAGE__->belongs_to( userid => 'Tees::App::Schema::Result::User' );

1;
