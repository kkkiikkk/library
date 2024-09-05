document.addEventListener 'DOMContentLoaded', ->
  stars = document.querySelectorAll('.star-rating input[type="radio"]')

  stars.forEach (star) ->
    star.addEventListener 'change', ->
      document.getElementById('ratingForm').submit()
