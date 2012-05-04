# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

candidates = User.create!([{name: 'Candidate 1', email: 'candidate1@sonofstoreengine.com', password: 'foobar'},
                    {name: 'Candidate 2', email: 'candidate2@sonofstoreengine.com', password: 'foobar'},
                    {name: 'Candidate 3', email: 'candidate3@sonofstoreengine.com', password: 'foobar'},
                    ])

reviewers = User.create([{name: 'Reviewer 1', email: 'reviewer1@hungrymachine.com', password: 'foobar'},
                    {name: 'Reviewer 2', email: 'reviewer2@hungrymachine.com', password: 'foobar'},
                    {name: 'Reviewer 3', email: 'reviewer3@hungrymachine.com', password: 'foobar'},
                    ])

admin = User.create(name: "Admin", email: 'admin@livingsocial.com', password: 'foobar', role: 'admin')

candidates.each do |user|
  user.create_candidate(youtube_link: 'https://www.youtube.com/watch?v=QsbmrCtiEUU')
end

reviewers.each do |user|
  user.create_reviewer
end

Candidate.find_by_name("Candidate 1").reviewers << Reviewer.find_by_name("Reviewer 1")
Candidate.find_by_name("Candidate 2").reviewers << Reviewer.find_by_name("Reviewer 2")
Candidate.find_by_name("Candidate 3").reviewers << Reviewer.find_by_name("Reviewer 3")

Question.create([{
  text: 'What wild whim led Willy Whitman to wander, whistling on a wharf, where a whale might reel and whirl' }])
Question.create([{
  text: 'Round the rough and rugged rocks, the ragged rascals rudely ran'}])
Question.create([{
  text: "She sells seashells by the seashore, Sister Suzy's sewing shirts for sailors"}])
