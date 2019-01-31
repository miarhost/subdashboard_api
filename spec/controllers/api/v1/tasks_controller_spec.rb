require 'rails_helper'

Rspec.describe Api::V1::TasksController, type: :controller do
  before do
    @base_json = { api_token: @user.api_token }
    @project_json = {task: {delivery_status: "1", name: "foo"}}
    @new_project_json = @base_json.merge(@task_json)
  end

  describe "actions" do
    describe "#create" do
       before do
        @request.env['RAW_POST_DATA'] = @new_task_json.to_json
         lambda do
          post :create
        end.should change(Task, :count).by(1)
      end

     it "returns ok" do
        expect(response.status).to eq(200)
        expect(Task.all.last.delivery_status).to eq(@new_task_json[:delivery_status])
        expect(Task.all.last.name).to eq(@new_task_json[:name])
      end
    end
  end
end
