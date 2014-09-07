class Resource < ActiveFedora::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_metadata 'descMetadata', type: DublinCoreDatastream
  has_attributes :title, :created, datastream: 'descMetadata', multiple: false
  has_attributes :created, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: false
  has_attributes :publisher, datastream: 'descMetadata', multiple: false
  has_attributes :date_of_publication, datastream: 'descMetadata', multiple: false
  has_attributes :subject, datastream: 'descMetadata', multiple: false
  has_file_datastream "attachment"
  has_file_datastream "thumbnail"

  validates_presence_of :title
  validates :date_of_publication, format: {with: /\A\[{0,1}\d+([\/-]\d{0,2}){0,2}\]{0,1}\z/}, allow_blank: true

  settings do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'cjk'
      indexes :subject, analyzer: 'cjk'
    end
  end
  after_save    { logger.debug ["Updating document... ", __elasticsearch__.index_document ].join }
  after_destroy { logger.debug ["Deleting document... ", __elasticsearch__.delete_document].join }
end
