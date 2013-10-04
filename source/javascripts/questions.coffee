#= require ./data

angular.module('geekOmeter.questions', ['geekOmeter.data']).
  factory 'questions', [ 'data', (data) ->
    questions = []
    showNames = (name for name, show of data.shows)

    for showName, show of data.shows
      for character in show.characters
        questions.push {
          text: character
          answer: showName
          options: showNames
        }
      for term in show.terms
        questions.push {
          text: term
          answer: showName
          options: showNames
        }

    _.shuffle(questions)
  ]

