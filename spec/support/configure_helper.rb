module ConfigureHelper
  def configure_defaults
    Ofsys.configure do |c|
      c.id_key = ENV['OFSYS_ID_KEY']
      c.key = ENV['OFSYS_KEY']
      c.id_project = ENV['OFSYS_ID_PROJECT']
    end
  end
end
