require 'rails_helper'

RSpec.describe Line, type: :model do

  describe "バリデーション" do
    subject { line.valid? }

    context "データが条件を満たすとき" do
      let(:line) { build(:line) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "genre が空のとき" do
      let(:line) { build(:line, genre: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(line.errors.messages[:genre]).to include "を入力してください"
      end
    end

    context "title が空のとき" do
      let(:line) { build(:line, title: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(line.errors.messages[:title]).to include "を入力してください"
      end
    end

    context "content が空のとき" do
      let(:line) { build(:line, content: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(line.errors.messages[:content]).to include "を入力してください"
      end
    end

  end
end