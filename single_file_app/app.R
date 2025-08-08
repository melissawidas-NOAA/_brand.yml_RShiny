library(shiny)
library(bslib)

theme <- bs_theme()
brand <- attr(theme, "brand")

ui <- tagList(
  # Custom header with logo - logo functionality has not been established in _brand.yml for R Shiny
  div(
    class = "container-fluid",
    style = "margin: 10px 0; display: flex; justify-content: space-between; align-items: center;",
    
    # Left side blank with a placeholder
    div(style = "visibility: hidden;", "Placeholder"),
    
    # Right side will have NOAA logo
    div(
      # note do not include www folder in file path or link will appear broken
      img(src = "logos/NOAA_FISHERIES_logoH.png", height = "60px", alt = "NOAA Fisheries Logo")
    )
  ),
  page_navbar(
    title = "Dashboard Title",
    
    nav_panel(
      title = "Fish",
      page_sidebar(
        sidebar = sidebar(
          title = "Fish Controls",
          sliderInput("fish_slider", 
                      "Number of Fish:", 
                      min = 0, 
                      max = 100, 
                      value = 50),
          
          radioButtons("fish_radio", 
                       "Fish Type:", 
                       choices = c("Freshwater", "Saltwater", "Both")),
          
          selectInput("fish_select", 
                      "Fish Species:", 
                      choices = c("Salmon", "Trout", "Bass", "Tuna", "Cod")),
          
          # Secondary and Info buttons
          p(),
          actionButton("primary_btn", "Primary Action", class = "btn-primary"),
          br(),
          actionButton("secondary_btn", "Secondary Action", class = "btn-secondary"),
          br(),
          actionButton("info_btn", "Info Action", class = "btn-info")
        ),
        card(
          card_header("Fish Information"),
          card_body(
            # Warning alerts to demonstrate brand styling
            div(
              class = "alert alert-success",
              role = "alert",
              strong("Warning: "), "Fish populations may be affected by seasonal changes."
            ),
            div(
              class = "alert alert-warning alert-dismissible",
              role = "alert",
              strong("Important: "), "Data collection is ongoing. Results are preliminary.",
              tags$button(type = "button", class = "btn-close", `data-bs-dismiss` = "alert", `aria-label` = "Close")
            ),
            "Fish tab content goes here"
          )
        )
      )
    ),
    
    nav_panel(
      title = "Climate",
      card(
        card_header("Climate Information"),
        card_body(
          # Warning for climate tab
          div(
            class = "alert alert-warning",
            role = "alert",
            tags$i(class = "fas fa-exclamation-triangle"), " ",
            "Climate is the weather conditions prevailing in an area in general or over a long period."
          ),
          navset_card_tab(
            nav_panel(title = "Ocean", 
                      "Ocean climate data would appear here"),
            nav_panel(title = "Land", 
                      "Land climate data would appear here")
          )
        )
      )
    ),
    
    nav_panel(
      title = "Energy",
      card(
        card_header("Energy Information"),
        card_body(
          # Multiple warnings and buttons for energy tab
          div(
            class = "alert alert-warning",
            role = "alert",
            strong("Notice: "), "Energy consumption data is updated monthly."
          ),
          div(
            class = "alert alert-danger alert-dismissible",
            role = "alert",
            strong("Maintenance Alert: "), "Some energy systems will be offline for maintenance on weekends.",
            tags$button(type = "button", class = "btn-close", `data-bs-dismiss` = "alert", `aria-label` = "Close")
          ),
          p("Energy tab content goes here"),
          p(),
          actionButton("energy_secondary", "Generate Report", class = "btn-secondary"),
          " ",
          actionButton("energy_info", "View Details", class = "btn-info")
        )
      )
    )
  )
)

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

shinyApp(ui, server)