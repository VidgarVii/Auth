class ApplicationContract < Dry::Validation::Contract
  config.messages.top_namespace = 'auth'
  config.messages.load_paths << AuthService.root.join('config/locales/errors.yml')
end
