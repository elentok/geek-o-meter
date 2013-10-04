#= require_tree .

angular.module('geekOmeter', ['geekOmeter.questions']).
  controller 'MainCtrl', ['$scope', 'questions', ($scope, questions) ->
    $scope.errorVisible = false
    $scope.questions = questions

    setQuestion = (index) ->
      if index >= 0 and index < questions.length
        $scope.questionIndex = index
        $scope.question = questions[index]

    setQuestion(0)
    
    setError = (message) ->
      if message?
        $scope.errorMessage = message
        $scope.errorVisible = true
      else
        $scope.errorMessage = ''
        $scope.errorVisible = false

    $scope.answer = (option) ->
      if option == $scope.question.answer
        $scope.errorVisible = false
        @next()
      else
        setError(
          "Wrong... the correct answer is #{$scope.question.answer}")

    $scope.next = ->
      setError(null)
      setQuestion($scope.questionIndex + 1)
  ]

