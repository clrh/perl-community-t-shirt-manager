package Tees::App::Schema::Result::Image;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table( 'image' );
__PACKAGE__->add_columns(
    imageid => {
        data_type => 'integer',
        is_auto_increment => 1,
        is_nullable => 0,
    },
    itemid => {
        data_type => 'integer',
        is_nullable => 1,
    },
    modelid => {
        data_type => 'integer',
        is_nullable => 1,
    },
    date => {
        data_type => 'date',
        is_nullable => 0,
    },
    filepath => {
        data_type => 'string',
        is_nullable => 0,
    },
);
__PACKAGE__->set_primary_key( 'imageid' );
__PACKAGE__->belongs_to( itemid => 'Tees::App::Schema::Result::Item' );
__PACKAGE__->belongs_to( modelid => 'Tees::App::Schema::Result::Model' );

1;
