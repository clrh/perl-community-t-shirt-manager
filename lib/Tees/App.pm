package Tees::App;
use Dancer ':syntax';

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

get '/new/model' => sub {
    template 'newmodel';
};

post '/new/model' => sub {
    add_model (params->{title});
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

sub add_model {
  my ($title) = @_;
  open (MODELS, ">>models.log");
  print MODELS "$title\n";
  close MODELS;
}

true;
