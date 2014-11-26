module Ofsys
  DefaultConfig = Struct.new(:id_key, :key, :id_project)

  def self.configure
    @config = DefaultConfig.new
    yield(@config) if block_given?
    @config
  end

  def self.config
    @config || configure
  end
end
