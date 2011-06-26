# Connect to your database.
use Tees::App::Schema;
my $schema = App::Schema->connect('dbi:SQLite:tees', 'root', 'root');
$schema->deploy;

my $user = $schema->resultset('User')->create({ login => 'eiro', passwd => 'passwd' });
my $item = $schema->resultset('Item')->create({ userid => $user->userid, color => 'black' });
my $model1 = $schema->resultset('Model')->create({ description => 'mon nouveau modele1'});
my $model2 = $schema->resultset('Model')->create({ description => 'mon nouveau modele2'});
my @models = $schema->resultset('Model')->all;
print $_->description for @models;
