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
  first_name: "Marcos",
  last_name: "Velasco",
  username: "admin",
  role: "admin",
  password: "password"
)

5.times do
  proj = Project.create(
    name: "#{Faker::Space.unique.nasa_space_craft} Project",
    description: Faker::Hacker.unique.say_something_smart,
    start_date: rand(1577854800..1590984000),
    end_date: rand(1590984000..1609390800),
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
      start_date: rand(1577854800..1590984000),
      end_date: rand(1590984000..1609390800),
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
      start_date: rand(1577854800..1590984000),
      end_date: rand(1590984000..1609390800),
      milestone_id: milestone.id
    )
    milestone.tasks << task
  end
end

progress = [5,10,15,20,25,30,35,40]

Task.all.each do |task|
  5.times do
    entry = Entry.create(
      date: rand(1590984000..1609390800),
      progress: progress.sample,
      notes: Faker::Lorem.sentence,
      task_id: task.id
    )
    task.entries << entry
  end
end

puts "Succesfull Seed"
