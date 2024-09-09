document.addEventListener 'DOMContentLoaded', ->
  stars = document.querySelectorAll('.star-rating input[type="radio"]')

  stars.forEach (star) ->
    star.addEventListener 'change', ->
      console.log('change')
      document.getElementById('ratingForm').submit()
