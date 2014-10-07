require 'rails_helper'

describe Vote do
  context "validations" do
    let(:good_vote) { Vote.new(value: 1) }
    let(:second_good_vote) { Vote.new(value: -1) }
    let(:bad_vote) { Vote.new(value: 2) }
    let(:second_bad_vote) { Vote.new(value: -2) }

    context "value is 1" do
      it 'is valid' do
        expect( good_vote.valid? ).to eq(true)
      end
    end

    context "value is -1" do
      it 'is valid' do
        expect( second_good_vote.valid? ).to eq(true)
      end
    end

    context "value is neither 1 or -1" do
      it 'is not valid' do
        expect( bad_vote.valid? ).to eq(false)
        expect( second_bad_vote.valid? ).to eq(false)
      end
    end
  end
end