require 'rails_helper'

describe "Sessions", type: :request do
  let(:user) { create :user }
  let(:params) do
    {
      email: user.email,
      password: 'qweqwe'
    }
  end

  describe 'POST /login' do
    context 'with invalid params' do
      before do
        post login_path, params: params
      end

      it 'retruns error' do
        expect(js_res[:errors][0]).to(eq('Invalid Email or password.'))
      end

      it 'retruns message' do
        expect(js_res[:messages][0]).to(eq('Invalid Email or password.'))
      end

      it 'retruns detail' do
        expect(js_res[:details][0]).to(eq('invalid'))
      end
    end
  end
end
