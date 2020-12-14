require 'rails_helper'

describe "Posts", type: :request do
  let(:user) { create :user }
  let(:token) { user.generate_access_token!.token }
  let(:headers) { { Authorization: "Token #{token};email=#{user.email}" } }

  describe 'GET /posts' do
    it 'returns posts' do
      create_list :post, 3
      get posts_path, headers: headers
      expect(js_res[:data].count).to(eq(3))
    end
  end
end
