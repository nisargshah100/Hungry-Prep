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

candidates.each do |user|
  user.create_candidate
end

reviewers.each do |user|
  user.create_reviewer
end

Candidate.find(1).reviewers << Reviewer.find(1)
Candidate.find(1).reviewers << Reviewer.find(2)
Candidate.find(2).reviewers << Reviewer.find(3)