# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserProject.destroy_all
UserTask.destroy_all
Task.destroy_all
User.destroy_all
Project.destroy_all

user = User.create(
  first_name: "Nick",
  last_name: "Smith",
  username: "nick123",
  password: "password"
)

proj_count = 0
3.times do
  project = Project.create(
    name: "Project#{proj_count}",
    description: "Make a taskManager prototype",
    start_date: "09/2#{5 + proj_count}/2020",
    deadline: "10/0#{2 + proj_count}/2020",
    completion_percentage: "0%"
  )
  user.projects << project
  proj_count += 1
end

project1 = Project.first
task_count = 0
5.times do
  task = Task.create(
    name: "task#{task_count}",
    start_date: "09/2#{4 + task_count}/2020",
    end_date: "10/#{2 + task_count}/2020",
    hours: "40hrs",
    completion_percentage: "0%",
    notes: "every #{task_count} task has notes",
    project_id: project1.id
  )
  project1.tasks << task
  user.tasks << task
  task_count += 1
end

puts "Succesfull Seed"
