# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#search' do
    before do
      Recipe.create(name: '雞蛋糕')
      Recipe.create(name: '蛋炒飯')
      Recipe.create(name: '蚵仔煎')
    end

    context 'when search recipes by 蛋' do
      subject { Recipe.search('蛋').pluck(:name) }
      it 'expects to contain 雞蛋糕 and 蛋炒飯' do
        is_expected.to contain_exactly('雞蛋糕', '蛋炒飯')
      end
    end
  end
end
