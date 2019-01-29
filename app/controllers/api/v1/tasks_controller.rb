class Api::V1::TasksController < ApplicationController

  before_action :find_task, only: [:show, :update]

  before_action only: :create do |c| 
    meth = c.method(:validate_json) 
    meth.call(@json.has_key?['task'] && @json['task']).responds_to?(:[]) && @json['task']['name']
  end 

  before_action only: :update do |u|
  	 meth = u.method(:validate_json)
  	 meth.call(@json.has_key?['task'])
  end

  before_action only: :create do |c| 
  	 meth = c.method(:check_for_existence)
  	 meth.call(@task, "Task", "find_by_name(@json['task']['name'])")
  end

  def index 
    render json: Task.where('user_id = ?', current_user.id)
  end
  
  def show
    @task = Task.show(params[:id])
  	if stale?(last_modified: @task.updated_at, public: true)
      render json: @task
    end
  end

  def create 
  	 if @task.present?
  	 	 render nothing: true, status: :conflict
  	 else
  	 	 @task = Task.new 
  	 	 update_values  @task, @json['task']
  	 	 render json: @task, status: :created, location: api_v1_task_url(@task)
  	 end
  end 
 
  private

  def find_task
  	 @task = Task.find_by_name(params[:name])
  	 render nothing: true, status: :not_found unless @task.present? && @task.user == @user
  end

end

