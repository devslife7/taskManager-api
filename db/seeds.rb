# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Entry.destroy_all
UserProject.destroy_all
UserTask.destroy_all
Task.destroy_all
User.destroy_all
Milestone.destroy_all
Project.destroy_all

user = User.create(
  first_name: "Mike",
  last_name: "Jones",
  username: "mike123",
  password: "password"
)

5.times do
  proj = Project.create(
    name: "#{Faker::Space.unique.nasa_space_craft} Project",
    description: Faker::Hacker.unique.say_something_smart,
    start_date: Faker::Date.between(from: '2020-01-01', to: '2020-06-01'),
    end_date: Faker::Date.between(from: '2020-06-02', to: '2020-12-29'),
    progress: 0
  )
  user.projects << proj
end

user.projects.each do |project|
  5.times do
    milestone = Milestone.create(
      name: "#{Faker::Space.unique.meteorite} Milestone",
      progress: 0,
      hours: 0,
      start_date: Faker::Date.between(from: '2020-01-01', to: '2020-06-01'),
      end_date: Faker::Date.between(from: '2020-06-02', to: '2020-12-29'),
      project_id: project.id
    )
    project.milestones << milestone
  end
end

Milestone.all.each do |milestone|
  5.times do
    task = Task.create(
      name: "#{Faker::Science.element} Task",
      progress: 0,
      hours: rand(20..40),
      notes: Faker::Lorem.sentence,
      start_date: Faker::Date.between(from: '2020-01-01', to: '2020-06-01'),
      end_date: Faker::Date.between(from: '2020-06-02', to: '2020-12-29'),
      milestone_id: milestone.id
    )
    milestone.tasks << task
  end
end

progress = [5,10,15,20,25,30,35,40]

Task.all.each do |task|
  5.times do
    entry = Entry.create(
      date: Faker::Date.between(from: '2020-09-01', to: '2020-10-29'),
      progress: progress.sample,
      notes: Faker::Lorem.sentence,
      task_id: task.id
    )
    task.entries << entry
  end
end

puts "Succesfull Seed"
