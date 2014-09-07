class DublinCoreDatastream < ActiveFedora::NtriplesRDFDatastream
  property :title, predicate: RDF::DC.title
  property :created, predicate: RDF::DC.created
  property :author, predicate: RDF::DC.creator
  property :publisher, predicate: RDF::DC.publisher
  property :date_of_publication, predicate: RDF::DC.date
  property :subject, predicate: RDF::DC.subject
end
