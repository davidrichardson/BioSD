
=head1 LICENSE

   Copyright 2013 EMBL - European Bioinformatics Institute

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

=cut

package BioSD::Publication;
use strict;
use warnings;

sub new{
  my ($class, $xml_element) = @_;
  my $self = {};
  bless $self, $class;

  $self->_xml_element($xml_element);
  return $self;
}

sub doi {
  my ($self) = @_;
  my ($doi) = map {$_->to_literal} $self->_xml_element->getChildrenByTagName('DOI');
  return $doi;
}

sub pubmed_id {
  my ($self) = @_;
  my ($pubmed_id) = map {$_->to_literal} $self->_xml_element->getChildrenByTagName('PubMedID');
  return $pubmed_id;
}

sub _xml_element {
  my ($self, $xml_element) = @_;
  if ($xml_element) {
    $self->{_xml_element} = $xml_element;
  }
  return $self->{_xml_element};
}


1;
