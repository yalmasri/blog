require 'rails_helper'

describe User, type: :model do
  context 'attributes' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it do
      is_expected.to define_enum_for(:status)
        .with_values(%i[active inactive])
    end
  end
end
