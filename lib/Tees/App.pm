package Tees::App;
use Dancer ':syntax';
use Data::Dumper qw{Dumper};
use Tees::App::Schema;

my $schema = Tees::App::Schema->connect('dbi:SQLite:tees.db');

if ( not -e 'tees.db' ) {
    $schema->deploy();
}

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

get '/new/model' => sub {
    template 'newmodel';
};

post '/new/model' => sub {
    $schema->resultset('Model')->create({
        description => params->{title}
    });
    return redirect '/list/models';
};

sub list_models {
    my @models = ();
    push @models, $_->description for $schema->resultset('Model')->all;
    return @models;
}

get '/list/models' => sub {
    my @models = list_models;
    return template 'listmodels' => {models => \@models};
};

true;
