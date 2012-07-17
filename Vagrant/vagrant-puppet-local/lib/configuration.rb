module VagrantPuppetLocal
  class Configuration < Vagrant::Config::Base
    attr_accessor :puppet_destroy_path
    attr_accessor :puppet_up_path

    def setDestroy?
      puppet_destroy_path
    end

    def setUp?
      puppet_up_path
    end

    def validate(env, errors)
      errors.add("Config path for destroy can not be empty") if puppet_destroy_path.empty?
      errors.add("Config path for up can not be empty") if puppet_up_path.empty?
    end
  end
end