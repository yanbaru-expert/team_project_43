require 'rails_helper'

RSpec.describe Genre, type: :model do
  
  describe "バリデーション" do
    subject { genre.valid? }

    context "データが条件を満たすとき" do
      let(:genre) { build(:genre) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "title が空のとき" do
      let(:genre) { build(:genre, title: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(genre.errors.messages[:title]).to include "を入力してください"
      end
    end

    context "parameter が空のとき" do
      let(:genre) { build(:genre, parameter: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(genre.errors.messages[:parameter]).to include "を入力してください"
      end
    end

    context "color が空のとき" do
      let(:genre) { build(:genre, color: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(genre.errors.messages[:color]).to include "を入力してください"
      end
    end

  end
end