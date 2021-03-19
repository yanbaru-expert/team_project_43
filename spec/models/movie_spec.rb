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

  describe "def watched_by?(user)" do
    let(:user) { create(:user) }
    let(:list) { create_list(:watched, 3) }

    context "指定したユーザーの視聴済みの動画が存在する場合" do
      it "trueを返す" do
        create(:watched, user: user)
        watched_movie = Watched.find_by(user_id: user.id)
        expect(watched_movie.present?).to be_truthy
      end
    end

    context "指定したユーザーの視聴済みの動画が存在しない場合" do
      it "falseを返す" do
        watched_movie = Watched.find_by(user_id: user.id)
        expect(watched_movie.present?).to be_falsey
      end
    end
  end

  describe "def self.total_count" do
    it "ジャンル別教材数の配列からtestジャンルの教材数を正しく取り出せる" do
      create_list(:movie, 3, genre: "test")
      create_list(:movie, 7)
      total_counts = Movie.group(:genre).count
      expect(total_counts["test"]).to eq 3
    end
  end

  describe "def self.completed_count(user)" do
    it "指定したユーザーの視聴済み教材数の配列から、testジャンルの教材数を正しく取り出せる" do
      user = create(:user)
      movie = create(:movie, genre: "test")
      create(:watched, user: user, movie_id: movie.id)
      create_list(:watched, 3, user: user)
      completed_counts = user.watched_movies.group(:genre).count
      expect(completed_counts["test"]).to eq 1
    end
  end
end