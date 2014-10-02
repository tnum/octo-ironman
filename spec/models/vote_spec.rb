require 'rails_helper'

describe Vote do
  describe "validations" do

    before do
      @post = Post.create(title: 'post title', body: 'post body must be long enough to be valid')
      good_vote = @post.vote.create(value: 1)
      second_good_vote = @post.votes.create(value: -1)
      bad_vote = @post.votes.create(value: 2)
      second_bad_vote = @post.votes.create(value: -2)
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( good_vote.valid? ).to eq(true)
        expect( second_good_vote.valid? ).to eq(true)
        expect( bad_vote.valid? ).to eq(false)
        expect( second_bad_vote.valid? ).to eq(false)
      end
    end
  end
end