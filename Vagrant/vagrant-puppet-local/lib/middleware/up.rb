module VaggrantPuppetLocal
  module Middleware
    class Up
      def initialize(app, env)
        @app = app
        @env = env
      end

      def call(env)
        @env = env
        if @env[:vm].config.puppet_local.setUp?
          apply_puppet
        end
        @app.call(env)
      end

      def apply_puppet
        @env[:ui].info I18n.t('vagrant.plugins.puppet-local.middleware.up.apply_puppet', 
          :path => @env[:vm].config.puppet_local.puppet_up_path)
          system 'puppet apply ' + @env[:vm].config.puppet_local.puppet_up_path
      end
    end
  end
end