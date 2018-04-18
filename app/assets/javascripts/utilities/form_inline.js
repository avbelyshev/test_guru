document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInlineLinkHandler)

  var errors = document.querySelector('.resource-errors')

  if (errors) {
    var resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var edit_text
  var cancel_text
  var page_lang = document.getElementsByTagName("HTML")[0].getAttribute('lang')
  switch (page_lang) {
    case 'ru':
      edit_text = 'Редактировать'
      cancel_text = 'Отменить'
      break;
    case 'en':
      edit_text = 'Edit'
      cancel_text = 'Cancel'
      break;
    default:
      edit_text = 'Edit'
      cancel_text = 'Cancel'
  }

  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')

  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  $formInline.toggle()
  $testTitle.toggle()

  if (link) {
    link.value = $formInline.is(':visible') ? cancel_text : edit_text
  }
}
