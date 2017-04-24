require 'rails_helper'
# Specs in this file have access to a helper object that includes
# the AdvertisementsHelper. For example:
#
# describe AdvertisementsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe ApplicationHelper, "#avatar_url" do
    it "displays avatar url by passing in a user" do
      user = build(:user)
      url = helper.avatar_url(user)
      expect(url).to eq("http://gravatar.com/avatar/744343da0b1785ae3c06618a92405e6a.png?s=48")
    end
end