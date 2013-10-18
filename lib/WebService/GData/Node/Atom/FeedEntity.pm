package WebService::GData::Node::Atom::FeedEntity;
use base 'WebService::GData::Node::Atom::AtomEntity';

use WebService::GData::Node::Atom::Feed();
use WebService::GData::Node::Atom::Logo();
use WebService::GData::Node::Atom::Generator();
our $VERSION = 0.01_01;

sub __init {
	my ($this,$params) = @_;
	
	$this->SUPER::__init($params);
	
    $this->_entity(WebService::GData::Node::Atom::Feed->new('gd:etag'=>$this->{_feed}->{'gd$etag'}));
    $this->{_logo} = WebService::GData::Node::Atom::Logo->new($this->{_feed}->{logo});
    $this->_entity->child($this->{_logo});
    $this->{_generator} = WebService::GData::Node::Atom::Generator->new($this->{_feed}->{generator});
    $this->_entity->child($this->{_generator});
    $this->set_children;
}

"The earth is blue like an orange.";
