class Attachment < ActiveRecord::Base
  attr_accessible :post_id, :pic

  belongs_to :post


  has_attached_file :pic, :styles => {:medium => "500x400#",:feed => "220x180#", :thumb => "150x100#" },
                    :storage => :s3,
                    :bucket => 'aweek1024',
                    :convert_options => { :thumb => "-quality 92" },
                    :s3_credentials => {
                        :access_key_id => 'AKIAI25BIECHIO4NCM3Q',
                        :secret_access_key => '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',
                    }
  # :s3_credentials => {
  #     :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  #     :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  # }

end
