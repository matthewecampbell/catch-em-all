require 'rails_helper'

RSpec.describe "backpack", type: :model do
  it "should have initial contents" do
    backpack = Backpack.new({"1" => 2})

    expect(backpack.contents).to eq({"1" => 2})
  end

  it "should have an empty hash as initial contents if no sesssion back" do
    backpack = Backpack.new(nil)
    expect(backpack.contents).to eq({})
  end

  it "should be able to add a pokemon" do
  backpack = Backpack.new({"1" => 2})

  backpack.add_pokemon(1)
  backpack.add_pokemon(2)

  expect(backpack.contents).to eq("1" => 3, "2" => 1)
  end

  it "should be able to calculate total" do
    backpack = Backpack.new({"1" => 2, "3" => 1})

    expect(backpack.total).to eq(3)
  end

  it "should give count of specific Pokemon" do
    backpack = Backpack.new({"1" => 2, "3" => 1})

    expect(backpack.count_of(1)).to eq(2)
  end
end
