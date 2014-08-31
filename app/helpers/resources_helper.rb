module ResourcesHelper
  def link_to_attachment(resource)
    link_to 'download', "http://localhost:8080/fedora/objects/#{resource.id}/datastreams/attachment/content" if resource.attachment.content
  end
end
