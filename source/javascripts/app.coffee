#= require_tree .

angular.module('geekOmeter', ['geekOmeter.questions']).
  controller 'MainCtrl', ['$scope', 'questions', ($scope, questions) ->
    $scope.errorVisible = false
    $scope.questions = questions
    $scope.successfulAnswers = 0
    $scope.status = ''
    $scope.state = 'frontpage'

    setQuestion = (index) ->
      if index >= 0 and index < questions.length
        $scope.status = "(Question #{index+1} of #{questions.length})"
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
      
    getScore = ->
      parseInt($scope.successfulAnswers * 100 / questions.length, 10)

    done = ->
      $scope.score = getScore()
      $scope.state = 'done'

    $scope.start = ->
      $scope.state = 'playing'

    $scope.answer = (option) ->
      if option == $scope.question.answer
        $scope.successfulAnswers++
        $scope.errorVisible = false
        @next()
      else
        setError(
          "Wrong... the correct answer is #{$scope.question.answer}")

    $scope.next = ->
      setError(null)
      if $scope.questionIndex + 1 == questions.length
        done()
      else
        setQuestion($scope.questionIndex + 1)
  ]

