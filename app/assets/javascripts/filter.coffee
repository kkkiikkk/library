document.addEventListener "DOMContentLoaded", ->
  toggleButton = document.getElementById("toggle-filters")
  filterPanel = document.getElementById("filter-panel")

  toggleButton.addEventListener "click", ->
    filterPanel.classList.toggle "active"
