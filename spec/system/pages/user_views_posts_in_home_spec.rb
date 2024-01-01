require "rails_helper"

describe "User visits the home page" do
  context "not authenticated" do
    it "and views the posts" do
      build_list(:user, 3) do |author, index|
        author.username = "user_#{index}"
        author.email = "user_#{index}@email.com"
        author.password = "123456"
        author.save!
        author.posts.create!(title: "Post #{index} title",
                             body: "Post #{index} body")
      end

      visit root_path

      expect(page).to have_content "Post 0 title"
      expect(page).to have_content "Post 1 title"
      expect(page).to have_content "Post 2 title"
      expect(page).to have_content "Post 0 body"
      expect(page).to have_content "Post 1 body"
      expect(page).to have_content "Post 2 body"
      expect(page).to have_content "Author: user_0"
      expect(page).to have_content "Author: user_1"
      expect(page).to have_content "Author: user_2"
    end
  end
end
