# Olympic API
## Introduction
This is an API for analyzing 2016 Olympic data. Information includes olympic athletes, events, and medal placings.
API Link: https://rhantak-be4-final.herokuapp.com/
## Tech Stack List
- Ruby 2.4.1
- Rails 5.2.4
- RSpec 4.0.0
- PostgreSQL
- Deployed on Heroku through Travis CI
## Initial Setup
To get set up on your local machine, you will first have to clone down the repository. Once that is complete, run the command `bundle install` to install dependencies. To set up development and test databases, run `rails db:{create,migrate}`. After the databases are created, you can run the command `rake import_data:import_olympians` to populate the database with data from the included CSV file. Finally, run `rails s` to launch a server on your local machine which you can make requests to (default address should be localhost:3000).
## How to Use
All endpoints are off of the main domain https://rhantak-be4-final.herokuapp.com/api/v1

### GET Olympians
With no query parameters, this endpoint will return a list of all olympic athletes in the database.

Example Request:
```
GET https://rhantak-be4-final.herokuapp.com/api/v1/olympians
```
Example Response:
```
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```
This endpoint can also take a query parameter of `age` in the form of a string of `youngest` or `oldest`, which will return the youngest or oldest olympic athelete.

Example Request: 
```
GET https://rhantak-be4-final.herokuapp.com/api/v1/olympians?age=youngest
```
Example Response:
```
{
  "olympians":
    [
      {
        "name": "Ana Iulia Dascl",
        "team": "Romania",
        "age": 13,
        "sport": "Swimming"
        "total_medals_won": 0
      }
    ]
}
```
### GET Olympian Stats
This endpoint will return aggregrated information for all olympic athletes.

Example Request:
```
GET https://rhantak-be4-final.herokuapp.com/api/v1/olympian_stats
```
Example Response:
```
  {
    "olympian_stats": {
      "total_competing_olympians": 3120
      "average_weight:" {
        "unit": "kg",
        "male_olympians": 75.4,
        "female_olympians": 70.2
      }
      "average_age:" 26.2
    }
  }
```
### GET Events
This endpoint will list all sports in the olympic games as well as all the events categorized under each individual sport.

Example Request: 
```
GET https://rhantak-be4-final.herokuapp.com/api/v1/events
```

Example Response:
```
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```
### GET Event Medalists
This endpoint list the medalists who placed in a specific olympic event.

Example Request: 
```
GET https://rhantak-be4-final.herokuapp.com/api/v1/events/:id/medalists
```

Example Response:
```
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```
## Running Tests
Once installed on your local machine as detailed above, tests can be run with the command `rake`. To run tests only in specific folders or files, you can use `bundle exec rspec` followed by a path, e.g: `bundle exec rspec spec/models`.
## How to Contribute
If you would like to make a contribution to this project, you can feel free to submit a pull request with a detailed description and tag [rhantak](https://github.com/rhantak) in a review request. You can see if there are any open issues or submit one at the link below:

[Olympic API Agile Board](https://github.com/rhantak/be4_final/projects/1)
## Known Issues
There are no known issues currently. If you find one, please submit it to the project board linked above.
## Core Contributors
- [Ryan Hantak](https://github.com/rhantak)
## Schema Design
<img width="941" alt="Screen Shot 2020-03-04 at 2 34 06 AM" src="https://user-images.githubusercontent.com/47759923/75865393-bcbf9e80-5dc0-11ea-834e-5cf1bbb126e9.png">

