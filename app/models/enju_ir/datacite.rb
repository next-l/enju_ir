module EnjuIr
  class Datacite
    include ActiveModel::Model
    include ActiveModel::Attributes
    attribute :id, :string
    attribute :event, :string
    attribute :prefix, :string
    attribute :suffix, :string
    attribute :doi, :string
    attribute :identifiers, array: :string
    attribute :creators, array: :string
    attribute :contributors, array: :string
    attribute :titles, array: :string
    attribute :publisher, :string
    attribute :container, :string
    attribute :subjects, array: :string
    attribute :dates, array: :string
    attribute :language, :string
    attribute :creators, array: :string
    attribute :publicationYear, :integer
    attribute :url, :string
    attribute :types, :string
    attribute :schema_version, :string
    attribute :alternateIdentifiers, array: :string
    attribute :relatedIdentifiers, array: :string
    attribute :sizes, array: :string
    attribute :formats, array: :string
    attribute :version, :string
    attribute :rightsList, array: :string
    attribute :descriptions, array: :string
    attribute :geoLocations, array: :string
    attribute :fundingReferences, array: :string
    attribute :xml, :string
    attribute :metadataVersion, :integer
    attribute :schemaVersion, :string
    attribute :contentUrl, :string
    attribute :source, :string
    attribute :isActive, :boolean
    attribute :state, :string
    attribute :reason, :string
    attribute :created, :string
    attribute :registered, :string
    attribute :updated, :string
    attribute :published, :string
    attribute :viewCount, :integer
    attribute :viewsOverTime, :string
    attribute :downloadCount, :integer
    attribute :downloadsOverTime, :string
    attribute :referenceCount, :integer
    attribute :citationCount, :integer
    attribute :citationsOverTime, :string
    attribute :partCount, :integer
    attribute :partOfCount, :integer
    attribute :versionCount, :integer
    attribute :versionOfCount, :integer

    def self.get(doi, type: 'dois')
      base_url = ENV.fetch('DATACITE_API_URL', 'https://api.test.datacite.org')
      case type
      when 'works'
        uri = URI.parse("#{base_url}/works/#{doi}")
      else
        uri = URI.parse("#{base_url}/dois/#{doi}")
      end

      response = Net::HTTP.get_response(uri)
      self.new(JSON.parse(response.body)['data']['attributes'])
   end
  end
end
