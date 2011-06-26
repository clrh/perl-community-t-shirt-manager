package Tees::App::Schema::Result::Model;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table( 'model' );
__PACKAGE__->add_columns( 
    'modelid',
    {
        data_type => 'integer',
        is_auto_increment => 1,
        is_nullable => 0,
    },
    'description',
    {
        data_type => 'string',
        is_nullable => 1,
    },
    'author_design',
    {
        data_type => 'string',
        is_nullable => 1,
    },
);

__PACKAGE__->set_primary_key( 'modelid' );
__PACKAGE__->has_many( images => 'App::Schema::Result::Image', 'imageid' );
__PACKAGE__->has_many( items => 'App::Schema::Result::Item', 'itemid' );


1;
