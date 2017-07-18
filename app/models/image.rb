class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  def uptoken
    bucket = config[:bucket_name]
    put_policy = Qiniu::Auth::PutPolicy.new(bucket, nil, 3600)
    put_policy.callback_body = config[:callback_body]
    Qiniu::Auth.generate_uptoken(put_policy) # uptoken
    # { uptoken: uptoken, bucket: bucket, domain: domain }
  end

  def config
    @config ||= Rails.application.config_for(:qiniu_storage)
  end

  def domain
    "http://#{Qiniu::QiniuDomain['ceshi-photo']}"
  end
end
