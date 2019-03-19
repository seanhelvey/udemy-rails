require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "#validations" do
    it 'should test factory is valid' do
      expect(build :article).to be_valid
    end

    it 'should test presence of title' do
      article = build :article, title: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:title]).to include("can't be blank")
    end

    it 'should test presenece of content' do
      article = build :article, content: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:content]).to include("can't be blank")
    end  

    it 'should test presenece of slug' do
      article = build :article, slug: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:slug]).to include("can't be blank")
    end  

    it 'should test uniqueness of slug' do
      article = create :article
      another_article = build :article, slug: article.slug
      expect(another_article).not_to be_valid
    end
  end

  describe '.recent' do
    it 'should return recent articles' do
      old_article = create :article
      newer_article = create :article
      expect(described_class.recent).to eq(
        [ newer_article, old_article ]
      )
      old_article.update_column :created_at, Time.now
      expect(described_class.recent).to eq(
        [ old_article, newer_article ]
      )      
    end
  end
end