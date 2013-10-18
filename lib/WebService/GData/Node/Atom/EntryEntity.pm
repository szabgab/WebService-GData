package WebService::GData::Node::Atom::EntryEntity;
use base 'WebService::GData::Node::Atom::AtomEntity';
use WebService::GData::Node::Atom::Content();
use WebService::GData::Node::Atom::Summary();
use WebService::GData::Node::Atom::Entry();
use WebService::GData::Node::Atom::Published();
our $VERSION = 0.01_01;

sub __init {
    my ($this,$params) = @_;
	
    $this->SUPER::__init($params);
    $this->_entity(WebService::GData::Node::Atom::Entry->new('gd:etag'=>$this->{_feed}->{'gd$etag'}));	
    $this->{_content}= WebService::GData::Node::Atom::Content->new($this->{_feed}->{content});
    $this->{_summary}= WebService::GData::Node::Atom::Summary->new($this->{_feed}->{summary});   
    $this->{_published}= WebService::GData::Node::Atom::Published->new($this->{_feed}->{published}); 
    $this->_entity->child($this->{_published})->child($this->{_summary})->child($this->{_content});
    $this->set_children;

}


"The earth is blue like an orange.";

__END__
