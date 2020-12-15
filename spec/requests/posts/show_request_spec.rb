require 'rails_helper'

describe "Posts", type: :request do
  let(:user) { create :user }
  let(:token) { user.generate_access_token!.token }
  let(:headers) { { Authorization: "Token token=#{token};email=#{user.email}" } }
  let(:post) { create :post }

  describe 'GET /posts/:id' do
    it 'returns post id' do
      get post_path(post), headers: headers
      expect(js_res[:data][:id]).to(eq(post.id))
    end

    it 'returns post title' do
      get post_path(post), headers: headers
      expect(js_res[:data][:title]).to(eq(post.title))
    end
  end
end
