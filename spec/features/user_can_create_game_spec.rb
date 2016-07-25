require 'rails_helper'

RSpec.feature "User creates game", type: :feature do
  scenario "when end game button is clicked" do
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

 click_on "End Game"

 game = Game.last

 expect(Game.count).to eq(1)
 expect(game.user_name).to eq("Andrew")
 expect(game.game_pokemons.first.quantity).to eq(2)
 end
end
