module VaggrantPuppetLocal
  module Middleware
    class Destroy
      def initialize(app, env)
        @app = app
        @env = env
      end

      def call(env)
        @env = env
        if @env[:vm].config.puppet_local.setDestroy?
          apply_puppet
        end
        @app.call(env)
      end

      def apply_puppet
        @env[:ui].info I18n.t('vagrant.plugins.puppet-local.middleware.destroy.apply_puppet', 
          :path => @env[:vm].config.puppet_local.puppet_destroy_path)
          system 'puppet apply ' + @env[:vm].config.puppet_local.puppet_destroy_path
      end
    end
  end
end