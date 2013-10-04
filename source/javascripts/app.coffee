#= require_tree .

angular.module('geekOmeter', ['geekOmeter.questions']).
  controller 'MainCtrl', ['$scope', 'questions', ($scope, questions) ->
    console.log "main controller initialized"
    console.log "questions", questions
  ]

