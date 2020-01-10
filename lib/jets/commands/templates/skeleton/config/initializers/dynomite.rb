Dynomite.configure do |config|
  config.endpoint = "http://localhost:8000" if Jets.env.test?
  config.namespace = Jets.config.table_namespace
end
