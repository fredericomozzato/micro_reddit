require "rails_helper"

describe "User views a post" do
  it "and leaves a comment" do
    author = create(:user, username: "author", email: "author@email.com")
    reader = create(:user, username: "reader", email: "reader@email.com")
    post = create(:post, author: author)

    login_as reader, scope: :user
    visit root_path
    click_on "Comments (0)"
    fill_in "Comment", with: "This is a comment"
    click_on "Post comment"

    expect(page).to have_content "This is a comment"
    expect(page).to have_content "Author: reader"
    expect(page).to have_content "Comments (1)"
  end
end
