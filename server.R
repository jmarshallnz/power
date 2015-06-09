library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  col   <- c("blue", "red")

  draw_poly <- function(x, y, col, ypos=0) {
    polygon(c(x[1], x, x[length(x)]), ypos+c(0, y, 0), col=col, border=NA)
  }

  fade_col <- function(col, alpha) {
    rgb(t(col2rgb(col)), alpha=alpha*255, maxColorValue=255)
  }

  output$plot <- renderPlot({

    z_se_default <- 1/sqrt(20)
    z_d_default  <- 1

    z_0 <- 0
    z_a <- input$d
    z_se <- 1/sqrt(input$n)
    z_alpha <- qnorm(input$alpha, lower=FALSE) * z_se

    # suitable range is +/- 3 s.e.
    xmin <- z_0 - 3*z_se_default
    xmax <- z_0 + z_d_default + 3*z_se_default

    x <- seq(xmin, xmax, length.out=1000)

    y1 <- dnorm(x, z_0, z_se)
    y2 <- dnorm(x, z_a, z_se)

    ymax <- max(y1, y2)*1.05

    plot_cex  <- 1.5
    par(mai=c(0.5,0.1,0.5,0.1))
    plot(NULL,xlab="F", ylab="", xlim=c(xmin, xmax), ylim=c(0,ymax), type="l", yaxt="n", xaxt="n", main="Distribution of the sample mean", xaxs="i", yaxs="i", cex.main=plot_cex)

    # draw polygons for test statistic under H_0 and H_a
    draw_poly(x, y1, fade_col(col[1], 0.1))
    draw_poly(x, y2, fade_col(col[2], 0.1))

    # draw darker for alpha and beta
    draw_poly(x[x > z_alpha], y1[x > z_alpha], fade_col(col[1], 0.3))
    draw_poly(x[x < z_alpha], y2[x < z_alpha], fade_col(col[2], 0.3))

    # hypothesis test cut-off
    abline(v=z_alpha)

    # alpha and beta
    text(z_alpha, ymax * 0.1, expression(alpha), adj = c(-0.5, 0.5), cex=plot_cex)
    text(z_alpha, ymax * 0.1, expression(beta), adj = c(1.5, 0.5), cex=plot_cex)
    text(z_a + z_se, dnorm(z_a + z_se, z_a, z_se), sprintf("Power = %2.1f%%", 100*pnorm(z_alpha, z_a, z_se, lower=FALSE)), adj = c(-0.05, 0.5), cex=plot_cex)

    axis(side=1, at = c(z_0, z_alpha, z_a), labels=c(expression(mu[0]), expression(z[alpha]), expression(mu[a])), cex.axis=plot_cex)

    legend("topright", legend=c("Null hypothesis", "Alternate hypothesis"), fill=col, cex=plot_cex, bg="transparent")

  })

})

