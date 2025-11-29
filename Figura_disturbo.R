# Set up two panels side by side with overall title
png("Figures/disturbo_2.png", res=150, width=1000, height=800)
par(mfrow = c(1, 2), oma = c(0, 0, 3, 0), mar=c(2,3,4,2))

# Left panel: Two overlayed density plots
x1 <- seq(-2, 16, length.out = 1000)
y1 <- dnorm(x1, mean = 10, sd = 2)
y2 <- dnorm(x1, mean = 3, sd = 1)* 0.05

plot(x1, y1, type = "l", col = "blue", lwd = 2,
     xlab = "Value", ylab = "Density",
     #main = "Two Normal Distributions",
     ylim = c(0, max(c(y1, y2)+0.1)), xlim=c(0,20))

# Shade the entire area under the mean=3, sd=1 distribution
polygon(c(min(x1), x1, max(x1)), c(0, y2, 0),
        col = "gray", border = NA)

# Redraw the lines on top
lines(x1, y1, col = "black", lwd = 2)
lines(x1, y2, col = "black", lwd = 2)

#legend("topright", legend = c("Mean=10, SD=2", "Mean=3, SD=1"),
#       col = c("black", "red"), lwd = 2)

# Right panel: Normal distribution with right tail highlighted
x2 <- seq(4, 16, length.out = 1000)
y3 <- dnorm(x2, mean = 10, sd = 2)

# Find the critical value for p = 0.05 (left tail - lower 5%)
critical_value <- qnorm(0.05, mean = 10, sd = 2)

plot(x2, y3, type = "l", col = "black", lwd = 2,
     xlab = "Value", ylab = "Density", ylim = c(0, max(c(y1, y2)+0.1)), xlim=c(0,20))

# Shade the left tail (p = 0.05 - lower 5%)
x_tail <- seq(4, critical_value, length.out = 1000)
y_tail <- dnorm(x_tail, mean = 10, sd = 2)
polygon(c(4, x_tail, critical_value), c(0, y_tail, 0),
        col = "gray", border = NA)

# Redraw the line on top
lines(x2, y3, col = "black", lwd = 2)

# Add overall title
#mtext("Due diverse possibilità", outer = TRUE, cex = 1.5, font = 2)

# Reset plotting parameters
par(mfrow = c(1, 1))
dev.off()
