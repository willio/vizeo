module VideosHelper

  def embed(embed_url)
    embed_id = embed_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{embed_id}")
  end

end
