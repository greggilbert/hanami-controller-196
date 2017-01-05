module Web::Controllers::Home
  class Index
    include Web::Action
    include Hanami::Action::Session

    expose :the_msg

    def call(params)
      @the_msg = flash[:msg]
      p "THIS IS -> #{@the_msg}"
    end
  end

  class Doit
    include Web::Action
    include Hanami::Action::Session

    def call(params)
      flash[:msg] = "I did it!"
      redirect_to routes.home_path
    end

    def verify_csrf_token?
      false
    end
  end
end
