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
      expect(page).to have_content "Comments (0)"
    end

    it "and can't create post with empty title/body" do
      user = create(:user)

      login_as user, scope: :user
      visit new_post_path
      click_on "Create Post"

      expect(page).to have_content "Error creating post"
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Body can't be blank"
      expect(page).to have_field "Title"
      expect(page).to have_field "Body"
    end
  end

  context "unauthenticated" do
    it "and can't access the form" do
      visit new_post_path

      expect(current_path).to eq new_user_session_path
    end
  end
end
