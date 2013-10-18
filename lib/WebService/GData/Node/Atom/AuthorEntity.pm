package WebService::GData::Node::Atom::AuthorEntity;
use base 'WebService::GData::Node::AbstractEntity';
use WebService::GData::Node::Atom::Author();
use WebService::GData::Node::Atom::Uri();
use WebService::GData::Node::Atom::Name();

our $VERSION = 0.01_02;

sub __init {
	my ($this,$params) = @_;

	$this->_entity(WebService::GData::Node::Atom::Author->new());
	$this->{_name}   = WebService::GData::Node::Atom::Name->new(
	   text=>ref $params->{name}? $params->{name}->{'$t'}: $params->{name} );
	$this->{_uri}    = WebService::GData::Node::Atom::Uri->new(
	   text=>ref $params->{uri} ? $params->{uri}->{'$t'} : $params->{uri}  );

	$this->_entity->child($this->{_name})->child($this->{_uri});
	 
}



1;
