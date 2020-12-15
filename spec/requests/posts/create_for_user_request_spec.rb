require 'rails_helper'

describe "Posts", type: :request do
  let(:user) { create :user }
  let(:token) { user.generate_access_token!.token }
  let(:headers) { { Authorization: "Token token=#{token};email=#{user.email}" } }
  let(:params) do
    {
      post: {
        title: 'title',
        body: 'body',
        user_id: user.id
      }
    }
  end

  describe 'POST /posts' do
    context 'with user_id' do
      before do
        post posts_path, headers: headers, params: params
      end

      it 'creates post for user' do
        expect(user.posts.count).to(eq(1))
      end

      it 'creates post' do
        expect(Post.count).to(eq(1))
      end
    end
  end
end
