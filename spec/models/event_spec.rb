require 'rails_helper'

RSpec.describe Event, type: :model do
  context "While creating new user" do
    it "returns false if not valid" do
      u = Event.new
      expect(u.save).to eql(false)
    end

    it "returns true if valid entry" do
      u = Event.create(name: "blah's event",body: "Blah's events body!",date: "2020-05-05 20:10:00")
      expect(u.name).to eql("blah's event")
    end
  end
end
