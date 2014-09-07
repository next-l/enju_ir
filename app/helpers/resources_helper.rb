module ResourcesHelper
  def url_for_thumbnail(resource)
    "#{Setting.fedora.base_url}/objects/#{resource.id}/datastreams/thumbnail/content" if resource.thumbnail.content
  end

  def url_for_attachment(resource)
    "#{Setting.fedora.base_url}/objects/#{resource.id}/datastreams/attachment/content" if resource.attachment.content
  end
end
