require 'rails_helper'

RSpec.feature "User Capture Pokemon", type: :feature do
  scenario "should display a capture message and backpack contents" do
    Pokemon.create(name: "Pikachu",
                  image_url: "http://core.dawnolmo.com/50_pokemon__9_pikachu_by_megbeth-d5fga3f_original.png")

   visit root_path

   assert page.has_content?("Backpack: 0")

   click_button "Capture"

   assert page.has_content?("You now have 1 Pikachu.")
   assert page.has_content?("Backpack: 1")

   click_button "Capture"

   assert page.has_content?("You now have 2 Pikachus.")
   assert page.has_content?("Backpack: 2")
  end
end
