CarrierWave.configure do |config|
  config.grid_fs_database = Mongoid.database.name
  config.grid_fs_host = Mongoid.config.master.connection.host
  config.grid_fs_access_url = "/images"
  config.storage = :grid_fs
end
