module EnjuIr
  class Datacite
    include ActiveModel::Model
    include ActiveModel::Attributes
    attribute :id, :string
    attribute :event, :string
    attribute :doi, :string
    attribute :creators, array: :string
    attribute :titles, array: :string
    attribute :publisher, :string
    attribute :publicationYear, :integer
    attribute :url, :string
    attribute :types, :string
    attribute :schema_version, :string
  end
end
