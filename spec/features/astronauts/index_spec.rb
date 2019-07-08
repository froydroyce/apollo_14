require 'rails_helper'

RSpec.describe "Astronauts Index" do
  describe "As a visitor" do
    before(:each) do
      @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @edwin = Astronaut.create!(name: "Edwin Aldrin", age: 34, job: "Lunar Module pilot")
      @mission_1 = @neil.missions.create!(title: "Capricorn 4", time_in_space: 366)
      @mission_2 = @neil.missions.create!(title: "Apollo 13", time_in_space: 273)
      @mission_3 = @neil.missions.create!(title: "Gemini 7", time_in_space: 478)
      @mission_4 = @edwin.missions.create!(title: "Gemini 7", time_in_space: 478)
      @mission_5 = @edwin.missions.create!(title: "Apollo 13", time_in_space: 273)
      visit astronauts_path
    end

    it "I see a list of astronauts with the following info:\n
      - Name\n
      - Age\n
      - Job" do
      within("#astronaut-#{@neil.id}") do
        expect(page).to have_content(@neil.name)
        expect(page).to have_content(@neil.age)
        expect(page).to have_content(@neil.job)
      end

      within("#astronaut-#{@edwin.id}") do
        expect(page).to have_content(@edwin.name)
        expect(page).to have_content(@edwin.age)
        expect(page).to have_content(@edwin.job)
      end
    end

    it "I see the average age of all astronauts" do
      expect(page).to have_content("Average Age of Astronauts: 35")
    end

    it "I see a list of the space missions' in alphabetical order for each astronaut." do
      within("#astronaut-#{@neil.id}") do
        expect(page).to have_content("Apollo 13")
        expect(page).to have_content("Capricorn")
        expect(page).to have_content("Gemini 7")
      end

      within("#astronaut-#{@edwin.id}") do
        expect(page).to have_content("Apollo 13")
        expect(page).to have_content("Gemini 7")
      end
    end

    it "I see the total time in space for each astronaut." do
      within("#astronaut-#{@neil.id}") do
        expect(page).to have_content("Total Time in Space: 1117")
      end

      within("#astronaut-#{@edwin.id}") do
        expect(page).to have_content("Total Time in Space: 751")
      end
    end
  end
end
