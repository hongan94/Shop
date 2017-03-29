#= require active_admin/base
#= require active_admin_flat_skin
#= require chartkick

$ ->
  $('.image').on 'change', ->
    output = document.getElementById('output')
    output.src = window.URL.createObjectURL(this.files[0])
    $('.preview_image').removeClass('hidden')
    return
  return