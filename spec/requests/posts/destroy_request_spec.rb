require 'rails_helper'

describe "Posts", type: :request do
  let(:user) { create :user }
  let(:token) { user.generate_access_token!.token }
  let(:headers) { { Authorization: "Token token=#{token};email=#{user.email}" } }
  let(:post) { create :post }

  describe 'DELETE /posts/:id' do
    it 'deletes post' do
      delete post_path(post), headers: headers
      expect(Post.count).to(eq(0))
    end
  end
end
