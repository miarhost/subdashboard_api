require 'rails_helper'
require 'jwt'

RSpec.describe User, type: :model do


  describe '#generate_jwt' do
    let(:user) { build(:user) }

    it 'is called before save' do
      expect(user).to receive(:generate_jwt)
      user.save
    end
  end

	 before(:each) do
   	subject { User.new(name: "Somename", email: "example@mail.com", password: "3216548") }
  end
 
  describe "ActiveRecord relations" do

  	 it "should have many tasks" do
  	 	 expect(subject).to have_many(:tasks)
  	 end

  end

  describe "ActiveModel validations" do

  	 it "should validate presence of name" do
  	 	 expect(subject).to validate_presence_of(:name)
  	 end

  	 it "should validate email format" do
  	 	 expect(subject.email).to match(/\A[a-zA-Z0-9]+\z/)
  	 end

  end

end

