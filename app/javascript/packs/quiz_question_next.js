    const questionButton = document.getElementById("show question")
    const question = document.getElementsByClassName("question-hidden")

    const showQuestion = () => {
      question[0].classList.add("question-displayed")
    }

    questionButton.addEventListener("click", showQuestion)

    const answersButton = document.getElementById("show answers")
    const answers = document.getElementsByClassName("answer-hidden")

    const showAnswer = () => {
      for (var i = 0; i < answers.length; i++) {
      answers[i].classList.add('answer-displayed')}
    }

    answersButton.addEventListener("click", showAnswer)

    const correctButton = document.getElementById("correct answer")
    const correctAnswer = document.getElementsByClassName("correct-answer")

    const showCorrectAnswer = () => {
      correctAnswer[0].classList.add('correct-displayed')
    }

    correctButton.addEventListener("click", showCorrectAnswer)
