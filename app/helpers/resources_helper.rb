module ResourcesHelper
  def link_to_attachment(resource)
    link_to 'download', "#{Setting.fedora.base_url}/objects/#{resource.id}/datastreams/attachment/content" if resource.attachment.content
  end
end
