document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) { runProgress(progressBar) }
})

function runProgress(progressBar) {
  var questionNumber = progressBar.dataset.questionNumber
  var questionsCount = progressBar.dataset.questionsCount
  var percent = Math.trunc((questionNumber - 1) / questionsCount * 100) + "%"

  progressBar.textContent = percent
  progressBar.style.width = percent
}
