class Background
  attr_reader :subject, :url
  def initialize(subject)
    @subject = subject.split(",")[0]
    @url = get_image
  end

  def get_image
    Unsplash::Photo.search("#{@subject}", page=1, per_page=1).first[:urls][:raw]
  end

  def id
    "1"
  end
end
