library(shiny)
library(markdown)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

#  mainPanel(

  titlePanel("The power of a hypothesis test", "I've got the power"),
  hr(),

  sidebarLayout(
    sidebarPanel(withMathJax(includeMarkdown("intro.md"))
    ),
    mainPanel(
      wellPanel(fluidRow(
                column(4,sliderInput("n",
                  "Sample size:",
                  min = 5,
                  max = 120,
                  step = 1,
                  ticks = F,
                  value = 20)),
                column(4,sliderInput("alpha",
                  "Significance level:",
                  min = 0.001,
                  max = 0.20,
                  step = 0.001,
                  ticks = F,
                  value = 0.05)),
               column(4,sliderInput("d",
                  "Effect size:",
                  min = 0,
                  max = 1.5,
                  step = 0.01,
                  ticks = F,
                  value = 0.5))
        )
      ),
      plotOutput("plot", height="400px")
    )
  )
#  mainPanel(withMathJax(includeMarkdown("propdiff.md")), width=12)
))

