class GamesController < ApplicationController

  def create
    game = Game.new(user_name: "Andrew") do |game|
      @backpack.contents.each do |pokemon_id, quantity|
        game.game_pokemons.new(pokemon_id: pokemon_id, quantity: quantity)
      end
    end
    if game.save
      session[:backpack] = nil
      flash[:notice] = "Your game is finished! You captured #{game.pokemons.count} species of Pokemon"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

end
