class SocialProfile < ApplicationRecord
  belongs_to :user
  store :other
  validates_uniqueness_of :uid, scope: :provider

  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']
    credentials = omniauth['credentials']
    info = omniauth['info']

    self.email = info['email']
    self.name = info['name']
    self.nickname = info['nickname']
    self.description = info['description'].try(:truncate, 255)
    self.image_url = info['image']
    case provider.to_s
    when 'google'
      self.nickname ||= info['email'].sub(/(.+)@gmail.com/, '\1')
    end
    self.set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  def set_values_by_raw_info(raw_info)
    case provider.to_s
    when 'google'
      self.url = raw_info['link']
    end

    self.raw_info = raw_info.to_json
    self.save!
  end
end
