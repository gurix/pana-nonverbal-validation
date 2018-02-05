require 'rails_helper'

describe Subject do
  describe '#birth_year' do
    it { is_expected.to validate_presence_of(:birth_year) }
  end

  describe '#gender' do
    it { is_expected.to validate_presence_of(:gender) }
  end

  describe '#education' do
    it { is_expected.to validate_presence_of(:education) }
  end

  describe '#residence' do
    it { is_expected.to validate_presence_of(:residence) }
  end
end
