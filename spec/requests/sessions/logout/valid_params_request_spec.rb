require 'rails_helper'

fdescribe "Sessions", type: :request do
  let(:user) { create :user }
  let(:token) { user.generate_access_token!.token }
  let(:headers) { { Authorization: "Token token=#{token};email=#{user.email}" } }

  describe 'DELETE /logout' do
    context 'with valid params' do
      before do
        delete logout_path, headers: headers
      end

      it 'responds with 200' do
        expect(response.code).to(eq('200'))
      end

      xit 'destroys access token' do
        expect(user.access_tokens.count).to(eq(0))
      end
    end
  end
end
