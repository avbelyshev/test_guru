document.addEventListener('turbolinks:load', function() {
  var timer = document.getElementById('timer')

  if (timer) { runTimer(timer) }
})

function runTimer() {
  var startTime = timer.dataset.startTime
  var passageTime = timer.dataset.passageTime
  var spentTime = Math.trunc(Date.now() / 1000) - startTime
  var remainingTime = passageTime - spentTime

  if (spentTime >= passageTime) {
    var resultPage = window.location.href + '/result'
    window.location.replace(resultPage)
  }

  var seconds = remainingTime % 60
  var minutes = (remainingTime - seconds) / 60
  if (seconds < 10) { seconds = '0' + seconds }

  timer.textContent = minutes + ':' + seconds

  setTimeout(runTimer, 1000, timer)
}
