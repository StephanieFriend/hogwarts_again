require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can see a list of professors with their info' do
    mcgonagall = Professor.create(name: "Minerva McGonagall",
                   age: 204,
                   specialty: "Transfiguration")
    snape = Professor.create(name: "Severus Snape",
                age: 48,
                specialty: "Potions")

    visit '/professors'

    expect(page).to have_content(mcgonagall.name)
    expect(page).to have_content(mcgonagall.age)
    expect(page).to have_content(snape.name)
    expect(page).to have_content(snape.specialty)
  end
end
