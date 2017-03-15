OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1440263736025487', 'ea88967fbc4f2ba5d1c1abaa6615b2fc'
end
