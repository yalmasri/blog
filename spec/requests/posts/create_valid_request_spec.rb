require 'rails_helper'

describe "Posts", type: :request do
  let(:user) { create :user }
  let(:token) { user.generate_access_token!.token }
  let(:headers) { { Authorization: "Token token=#{token};email=#{user.email}" } }
  let(:params) do
    {
      post: build(:post).attributes
    }
  end

  describe 'POST /posts' do
    context 'with valid params' do
      before do
        post posts_path, headers: headers, params: params
      end

      it 'creates post' do
        expect(Post.count).to(eq(1))
      end

      it 'returns title' do
        expect(Post.first.title).to(eq(params[:post]['title']))
      end

      it 'returns body' do
        expect(Post.first.body).to(eq(params[:post]['body']))
      end

      it 'returns title' do
        expect(js_res[:data][:title]).to(eq(params[:post]['title']))
      end

      it 'returns body' do
        expect(js_res[:data][:body]).to(eq(params[:post]['body']))
      end
    end
  end
end
