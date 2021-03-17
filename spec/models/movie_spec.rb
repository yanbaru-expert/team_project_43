require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "バリデーション" do
    subject { movie.valid? }

    context "データが条件を満たすとき" do
      let(:movie) { build(:movie) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "genre が空のとき" do
      let(:movie) { build(:movie, genre: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(movie.errors.messages[:genre]).to include "を入力してください"
      end
    end

    context "title が空のとき" do
      let(:movie) { build(:movie, title: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(movie.errors.messages[:title]).to include "を入力してください"
      end
    end

    context "url が空のとき" do
      let(:movie) { build(:movie, url: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(movie.errors.messages[:url]).to include "を入力してください"
      end
    end

  end
end