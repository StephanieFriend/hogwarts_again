require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can see a list of student names the professors have' do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

    visit "/professors/#{snape.id}"

    expect(page).to have_content(harry.name)
    expect(page).to have_content(longbottom.name)
    expect(page).to_not have_content(malfoy.name)
    expect(page).to_not have_content(longbottom.age)
  end
end


# As a visitor,
#      When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
#                                                              (e.g. "Neville Longbottom"
# "Hermione Granger"
# "Luna Lovegood")
# ```
