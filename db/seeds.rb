# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserProject.destroy_all
User.destroy_all
Project.destroy_all
Task.destroy_all

user = User.create(
  first_name: "Marcos",
  last_name: "Velasco",
  username: "marcos123",
  password_digest: "asdfasdf"
)

project = Project.create(
  name: "Project1",
  description: "Make a taskManager prototype",
  start_date: "09/26/2020",
  deadline: "10/02/2020",
  completion_percentage: "0%"
)

user.projects << project

taskNumber = 0

3.times do 
  Task.create(
    name: "task#{taskNumber}",
    start_date: "09/2#{7 + taskNumber}/2020",
    end_date: "10/2/2020",
    hours: "40hrs",
    completion_percentage: "0%",
    notes: "every #{taskNumber} task has notes",
    project_id: project.id
  )
  taskNumber += 1
end


