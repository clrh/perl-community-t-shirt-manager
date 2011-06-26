package Tees::App;
use Dancer ':syntax';
use Data::Dumper qw{Dumper};

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

get '/new/model' => sub {
    template 'newmodel';
};

post '/new/model' => sub {
    open (MODELS, ">>models.log");
    print MODELS params->{title}.",".params->{design_author}."\n";
    close MODELS;
    return redirect '/list/models';
};

sub list_models {
  open (MODELS, "models.log");
  my @lignes = <MODELS>;
}

get '/list/models' => sub {
    my @models = list_models;
    return template 'listmodels' => {models => \@models};
};

true;
