# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#search' do
    before do
      user = User.create!(email: 'abc123@gmail.com', password: '123456')
      user.recipes.create!(name: '雞蛋糕')
      user.recipes.create!(name: '蛋炒飯')
      user.recipes.create!(name: '蚵仔煎')
    end

    context 'when search recipes by 蛋' do
      it 'expects to contain 雞蛋糕 and 蛋炒飯' do
        expect(described_class.search('蛋').pluck(:name)).to contain_exactly('雞蛋糕', '蛋炒飯')
      end
    end
  end
end
