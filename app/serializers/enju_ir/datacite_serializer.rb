module EnjuIr
  class DataciteSerializer
    include FastJsonapi::ObjectSerializer
    attributes :event, :doi, :creators, :titles, :publisher, :publicationYear, :types, :schema_version
    set_type :dois
    set_key_transform :camel_lower

    attribute :url do |object|
      EnjuIr::Engine.routes.url_helpers.dataset_url(object.id)
    end
  end
end
