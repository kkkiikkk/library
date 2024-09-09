document.addEventListener "DOMContentLoaded", ->
  toggleButton = document.getElementById("toggle-filters")
  filterPanel = document.getElementById("filter-panel")
  console.log(filterPanel, 'FILTER PANEL')
  toggleButton.addEventListener "click", ->
    filterPanel.classList.toggle "active"
