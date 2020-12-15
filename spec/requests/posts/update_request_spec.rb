require 'rails_helper'

describe "Posts", type: :request do
  let(:user) { create :user }
  let(:token) { user.generate_access_token!.token }
  let(:headers) { { Authorization: "Token token=#{token};email=#{user.email}" } }
  let(:post) { create :post }
  let(:params) { { post: { title: 'new title' } } }

  describe 'PUT /posts/:id' do
    before do
      put post_path(post), headers: headers, params: params
      post.reload
    end

    it 'updates post title' do
      expect(post.title).to(eq('new title'))
    end
  end
end
