package WebService::GData::Node::PointEntity;
use base 'WebService::GData::Node::AbstractEntity';
use WebService::GData::Node::GeoRSS::Where;
use WebService::GData::Node::GML::Point;
use WebService::GData::Node::GML::Pos;

our $VERSION = 0.01_01;

sub __init {
	my ($this,$params) = @_;
    $this->SUPER::__init($params);	
	$this->_entity(WebService::GData::Node::GeoRSS::Where->new());
	$this->{_point}  = WebService::GData::Node::GML::Point->new();
	$this->{_pos}    = WebService::GData::Node::GML::Pos->new($params);
	$this->{_point}->child($this->{_pos});
	$this->_entity->child($this->{_point});
}


1;
