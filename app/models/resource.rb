# Generated via
#  `rails generate active_fedora::model Book`
class Resource < ActiveFedora::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  # Creating a #descMetadata method that returns the datastream. 
  #
  has_metadata "descMetadata", type: ResourceMetadata

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: true
  has_attributes :publisher, datastream: 'descMetadata', multiple: true
  has_attributes :date_of_publication, datastream: 'descMetadata', multiple: false


  validates_presence_of :title
  validates :date_of_publication, format: {with: /\A\[{0,1}\d+([\/-]\d{0,2}){0,2}\]{0,1}\z/}, allow_blank: true

  # Uncomment the following lines to add an #attachment method that is a
  #   file_datastream:
  #
  has_file_datastream "attachment"
  
  # "If you need to add additional attributes to the SOLR document, define the
  # #to_solr method and make sure to use super"
  #
  # def to_solr(solr_document={}, options={})
  #   super(solr_document, options)
  #   solr_document["my_attribute_s"] = my_attribute
  #   return solr_document
  # end

  after_save    { logger.debug ["Updating document... ", __elasticsearch__.index_document ].join }
  after_destroy { logger.debug ["Deleting document... ", __elasticsearch__.delete_document].join }
end
