class Website < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  validates_uniqueness_of :site_url
  before_validation :customize_url

  private

  def customize_url
    is_http = URI.extract(self.site_url, ['http', 'https'])
    self.site_url = "http://"+self.site_url if is_http.blank?
    self.site_url = URI(self.site_url).host.gsub("www.","")
  end
end

