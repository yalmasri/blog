require 'rails_helper'

describe "Sessions", type: :request do
  let(:user) { create :user, status: :inactive }
  let(:params) do
    {
      email: user.email,
      password: '123123'
    }
  end

  describe 'POST /login' do
    context 'with inactive user' do
      before do
        post login_path, params: params
      end

      it 'retruns error' do
        expect(js_res[:errors][0]).to(eq('Your account is not activated yet.'))
      end

      it 'retruns message' do
        expect(js_res[:messages][0]).to(eq('Your account is not activated yet.'))
      end

      it 'retruns detail' do
        expect(js_res[:details][0]).to(eq('inactive'))
      end
    end
  end
end
