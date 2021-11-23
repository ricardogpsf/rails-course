class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    before_action :authorize_user, expect: :login

    rescue_from Unauthorized, with: :handle_user_unauthorized
 
    def handle_user_unauthorized
        # render status: :unauthorized

        respond_to do |format|
            format.html { redirect_to login_path }
            format.json { render status: :unauthorized, body: '' }
        end
    end

    def login
    end

    def authorize_user
        token = request.headers['token'] 
        raise Unauthorized if token.blank?
        raise Unauthorized if find_used_from_api(token).blank?
    end

    def find_used_from_api(token)
        # get the info from a third party api/service
        # return { name: 'Chaves', id: '100' }
        return nil
    end
end
