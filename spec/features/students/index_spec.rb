require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can see a list of students and the number of professors each student has' do
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

    visit '/students'
    binding.pry
    within("#student-#{malfoy.id}") do
      expect(page).to have_content(malfoy.name)
      expect(page).to have_content(2)
    end
    within("#stuent-#{harry.id}") do
      expect(page).to have_content(harry.name)
      expect(page).to have_content(3)
    end
    within("#student-#{longbottom}") do
      expect(page).to have_content(longbottom.name)
      expect(page).to have_content(1)
    end
  end
end


# As a visitor,
#      When I visit '/students'
# I see a list of students and the number of professors each student has.
#                                                                        (e.g. "Draco Malfoy: 5"
# "Nymphadora Tonks: 10")
# ```
