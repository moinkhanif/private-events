require 'rails_helper'

RSpec.describe User, type: :model do
  context "While creating new user" do
    it "returns false if not valid" do
      u = User.new
      expect(u.save).to eql(false)
    end

    it "returns true if valid entry" do
      u = User.new(name: "blah")
      expect(u.save).to eql(true)
    end
  end
  
end
