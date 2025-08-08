server <- function(input, output, session) {
  # Server logic for button interactions
  observeEvent(input$secondary_btn, {
    showNotification("Secondary button clicked!", type = "message")
  })
  
  observeEvent(input$info_btn, {
    showNotification("Info button clicked!", type = "message")
  })
  
  observeEvent(input$energy_secondary, {
    showNotification("Generating energy report...", type = "message")
  })
  
  observeEvent(input$energy_info, {
    showNotification("Displaying energy details...", type = "message")
  })
}