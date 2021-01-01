module EnjuIr
  class DataciteSerializer
    include FastJsonapi::ObjectSerializer
    attributes :event, :doi, :creators, :titles, :publisher, :publication_year, :types, :url, :schema_version
    set_type :dois
    set_key_transform :camel_lower
  end
end
