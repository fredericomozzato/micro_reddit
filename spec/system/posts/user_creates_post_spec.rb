require "rails_helper"

describe "User visits the new post page" do
  context "authenticated" do
    it "and creates a post" do
      user = create(:user)

      login_as user, scope: :user
      visit root_path
      click_on "Create post"
      fill_in "Title", with: "First post"
      fill_in "Body", with: "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dolor omnis rerum, illum accusantium veritatis iste incidunt ipsa nulla temporibus non suscipit assumenda alias consequuntur fugit expedita velit error praesentium ea."
      click_on "Create Post"

      expect(page).to have_content "Post created"
      expect(page).to have_content "First post"
      expect(page).to have_content "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dolor omnis rerum, illum accusantium veritatis iste incidunt ipsa nulla temporibus non suscipit assumenda alias consequuntur fugit expedita velit error praesentium ea."
      expect(page).to have_content "No comments yet"
    end
  end

  context "unauthenticated" do
    it "and can't access the form"
  end
end
