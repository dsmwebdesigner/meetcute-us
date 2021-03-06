require 'rails_helper'

describe DesignPolicy do

  subject { DesignPolicy }

  let(:user) { build(:user) }
  let(:admin_user) { build(:admin_user) }
  let(:design) { build(:design) }

  [:index?, :create?, :update?, :destroy?, :edit?, :new?].each do |action|
    permissions action do
      it "denies access if user is not an admin" do
        expect(subject).not_to permit(user, design)
      end

      it "grants accses if user is an admin" do
        expect(subject).to permit(admin_user, design)
      end
    end
  end

end