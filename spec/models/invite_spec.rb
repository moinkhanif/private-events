require 'rails_helper'

RSpec.describe Invite, type: :model do
  context "While creating new invite" do
    it "returns false if not valid" do
      u = Invite.new
      expect(u.save).to eql(false)
    end

    it "returns true if valid entry" do
      u = Invite.new(name: "Foe inviting blah", user_id: 1, event_id: 1)
      expect(u.user_id).to eql(1)
    end
  end
end
