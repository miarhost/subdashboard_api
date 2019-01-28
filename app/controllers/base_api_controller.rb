class BaseApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :parse_request, :authenticate_user_from_token!

  private

  def authenticate_user_from_token!
    if @json['api_token']
      render nothing: true, status: :unautorized 
    else
      @user = nil
       User.find_each do |u| 
         if Devise.secure_compare(u.api_token, @json['api_token')
           @user = u
         end
       end
    end
  end

  def parse_request
    @json = JSON.parse(request.body.read)
  end

  def validate_json(condition)
    if condition
    	 render nothing: true, status: :bad_request
    end
  end
  
  def update_attributes(ivar, attributes)
  	 instance_variable_get(ivar).assign_attributes(attributes)
  	 if instance_variable_get(ivar).save
  	 	 render nothing: true, status: :ok
  	 else
  	 	 render nothing: true, status: :bad_request 
  	 end
  end
 
  def check_existence(ivar, object, finder)
  	 instance_variable_set(ivar, instance_eval(object+"."+finder))
  end


end
