require 'rails_helper'
require 'users_helper'
include SessionsHelper

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  let(:my_user) { create(:user) }
  describe "is_user_posts_not_zero" do
    it "should not have any posts" do
      expect( my_user.posts.count).to eq(0)
    end
  end
  
  describe "is_user_comments_not_zero" do
    it "should not have any comments" do
      expect( my_user.comments.count).to eq(0)
    end
  end
  
  describe "is_user_favorites_not_zero" do
    it "should not have any favorites" do
      expect( my_user.favorites.count).to eq(0)
    end
  end
end
