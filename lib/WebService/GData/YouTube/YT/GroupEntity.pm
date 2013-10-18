package WebService::GData::YouTube::YT::GroupEntity;
use base 'WebService::GData::Node::Media::GroupEntity';
use WebService::GData::YouTube::YT::Duration();
use WebService::GData::YouTube::YT::Uploaded();
use WebService::GData::YouTube::YT::Videoid();
use WebService::GData::YouTube::YT::AspectRatio();
use WebService::GData::YouTube::YT::Private();
use WebService::GData::YouTube::YT::Media::Content();
our $VERSION = 0.01_01;

sub __init {
	my ($this,$params) = @_;

	$this->SUPER::__init($params);
	
    $this->{'_duration'}     = WebService::GData::YouTube::YT::Duration->new($params->{'yt$duration'});
    $this->{'_uploaded'}     = WebService::GData::YouTube::YT::Uploaded->new($params->{'yt$uploaded'});  
    $this->{'_videoid'}      = WebService::GData::YouTube::YT::Videoid->new($params->{'yt$videoid'});    
    $this->{'_aspect_ratio'} = WebService::GData::YouTube::YT::AspectRatio->new($params->{'yt$aspectRatio'}); 
     my $content =  WebService::GData::Collection->new($params->{'media$content'},undef,sub { my $elm=shift; return WebService::GData::YouTube::YT::Media::Content->new($elm) if ref $elm ne 'WebService::GData::YouTube::YT::Media::Content';return $elm; });

    $this->{_content}=$content;
    if($params->{'yt$private'}){
        $this->{'_private'}  = WebService::GData::YouTube::YT::Private->new($params->{'yt$private'});
        $this->_entity->child($this->{'_private'});  
    }
}


1;

