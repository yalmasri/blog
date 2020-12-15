require 'rails_helper'

describe "Posts", type: :request do
  let(:user) { create :user }
  let(:token) { user.generate_access_token!.token }
  let(:headers) { { Authorization: "Token token=#{token};email=#{user.email}" } }
  let(:params) do
    {
      post: {
        title: '',
        body: ''
      }
    }
  end

  describe 'POST /posts' do
    context 'with invalid params' do
      before do
        post posts_path, headers: headers, params: params
      end

      it 'returns title error' do
        expect(js_res[:details][:title][0][:error]).to(eq('blank'))
      end

      it 'returns body error' do
        expect(js_res[:details][:body][0][:error]).to(eq('blank'))
      end
    end
  end
end
