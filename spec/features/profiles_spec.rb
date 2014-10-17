require 'rails_helper'

describe "Visiting profiles" do

	before do
		@user = create(:user)
		@post = create(:post)
		@comment = Comment.new(user: @user, body: "A Comment")
    allow(@comment).to receive(:send_favourite_emails)
    @comment.save
	end

	describe "Not signed in" do
		it "Shows profiles" do
			visit user_path(@user)
			expect(current_path).to eq(user_path(@user))

			expect( page ).to have_content(@user.name)
			expect( page ).to have_content(@post.title)
			expect( page ).to have_content(@comment.body)
		end
	end

end 