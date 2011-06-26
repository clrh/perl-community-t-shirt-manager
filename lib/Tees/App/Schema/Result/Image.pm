package Tees::App::Schema::Result::Image;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table( 'image' );
__PACKAGE__->add_columns( qw/ imageid itemid modelid date filepath / );
__PACKAGE__->set_primary_key( 'imageid' );
__PACKAGE__->belongs_to( itemid => 'App::Schema::Result::Item' );
__PACKAGE__->belongs_to( modelid => 'App::Schema::Result::Model' );

1;
