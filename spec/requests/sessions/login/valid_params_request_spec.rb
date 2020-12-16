require 'rails_helper'

describe "Sessions", type: :request do
  let(:user) { create :user }
  let(:params) do
    {
      email: user.email,
      password: '123123'
    }
  end

  describe 'POST /login' do
    context 'with valid params' do
      before do
        post login_path, params: params
      end

      it 'retruns token' do
        expect(js_res[:data][:token]).not_to(be_nil)
      end

      it 'retruns email' do
        expect(js_res[:data][:email]).to(eq(user.email))
      end
    end
  end
end
