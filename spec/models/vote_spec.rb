describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        
        before do
          @post = Post.create(title: 'post title', body: 'post body')
          1.times { @post.votes.create(value: 1) }
          1.times { @post.votes.create(value: -1) }
        end

        describe '#up_vote' do
          it "the up vote value should equal 1"
          expect( @post.up_votes ).to eq(1)
        end

        describe '#down_vote' do
          it "the down vote should equal -1"
          expect( @post.down_votes ).to eq(-1)
        end

      end
    end
  end
end