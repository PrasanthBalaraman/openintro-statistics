# load packages -----------------------------------------------------
library(openintro)

# inputs ------------------------------------------------------------

m = 9000
s = 1000
n = 15
se = s / sqrt(n)

# plot sketch -------------------------------------------------------

pdf("cflbs_sketch.pdf", height = 3, width = 6)

par(mar = c(2,1,1,0), las = 1, mgp = c(3,1,0))

# population

X <- seq((m - 3 * s),(m + 3 * s), 1)
Y <- dnorm(X, m, s)

plot(X, Y, type = 'l', axes = FALSE, 
     xlim = c(min(X), max(X)), ylim = c(0, 0.0015))
     ylab = "", lwd = 2.5)
lines(X, rep(0, length(X)), lwd = 1.5)
axis(1, at = seq((m - 3 * s), (m + 3 * s),s), cex.axis = 1.25)

# sampling

X <- seq((m - 5 * se),(m + 5 * se), 1)
Y <- dnorm(X, m, se)

lines(X, Y, type = 'l', lty = 2, lwd = 2.5, col = COL[1])

legend("topright", c("Population","Sampling (n = 15)"), 
       lty = c(1,2), col = c("black", COL[1]), inset = 0.03, 
       cex = 1.25, lwd = c(2.5,2.5))

dev.off()