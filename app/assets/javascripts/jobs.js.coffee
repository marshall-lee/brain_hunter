# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setupJobTagsInput = ->
  $form = $('form .edit_job')
  $input = $('#job_skill_list')

  $input.tagsInput
    autocomplete_url: '/jobs/search_skills'

$(document).on "ready", setupJobTagsInput
$(document).on "page:load", setupJobTagsInput