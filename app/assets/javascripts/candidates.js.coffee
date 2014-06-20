# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setupCandidatesTagsInput = ->
  $form = $('form .edit_candidate')
  $input = $('#candidate_skill_list')

  $input.tagsInput
    autocomplete_url: '/candidates/search_skills'

$(document).on "ready", setupCandidatesTagsInput
$(document).on "page:load", setupCandidatesTagsInput