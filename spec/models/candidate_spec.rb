require 'rails_helper'

RSpec.describe Candidate, type: :model do

  let(:candidate) { Candidate.new(name: "Albert") }

  describe "#votes" do

    it "is zero by default" do
      expect(candidate.votes).to eq(0)
    end

  end

  describe "#score" do

    it "is zero by default" do
      expect(candidate.score).to eq(0)
    end

    context "when there is only one candidates" do

      let(:albert) { Candidate.create!(name: "Albert", votes: 1) }

      it "is 100 if candidate has at least one vote" do
        expect(albert.score).to eq(100)
      end

    end

    context "when there are several candidates" do

      let!(:albert) { Candidate.create!(name: "Albert", votes: 30) }
      let!(:basile) { Candidate.create!(name: "Basile", votes: 100) }

      it "is the percentage of votes among all other candidates" do
        expect(albert.score).to be_within(0.001).of(23.0769230769)
        expect(basile.score).to be_within(0.001).of(76.9230769231)
      end

    end

  end

  describe "#absolute_winner?" do

    let!(:albert) { Candidate.create!(name: "Albert", votes: 100) }
    let!(:basile) { Candidate.create!(name: "Basile", votes: 1000) }
    let!(:cecile) { Candidate.create!(name: "Cécile", votes: 100) }

    it "is true if score is strictly greater than 50%" do
      expect(albert).to_not be_absolute_winner
      expect(basile).to be_absolute_winner
      expect(cecile).to_not be_absolute_winner
    end

  end

  describe ".winners" do

    context "an absolute winner exists" do

      let!(:albert) { Candidate.create!(name: "Albert", votes: 100) }
      let!(:basile) { Candidate.create!(name: "Basile", votes: 1000) }
      let!(:cecile) { Candidate.create!(name: "Cécile", votes: 100) }

      it "is the absolute winner" do
        expect(Candidate.winners).to eq([basile])
      end

    end

    context "a second round will be required" do

      let!(:albert) { Candidate.create!(name: "Albert", votes: 200) }
      let!(:basile) { Candidate.create!(name: "Basile", votes: 300) }
      let!(:cecile) { Candidate.create!(name: "Cécile", votes: 400) }

      it "is orders by descending scores, ordered by descending scores" do
        expect(Candidate.winners).to eq([cecile, basile])
      end

    end

  end

end
