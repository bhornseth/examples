module RackMiddleware
  class QuietNow
    def initialize(app)
      @app = app
    end

    def call(env)
      if some_condition?
        ::Rails.logger.silence { @app.call(env) }
      else
        @app.call(env)
      end
    end
  end
end
