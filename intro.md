In a one-sided hypothesis test for a population mean $\mu$, we're interested in testing the hypotheses
$$
\begin{align}
H_0: \mu &= \mu_0,\\\\
H_a: \mu &= \mu_a > \mu_0.
\end{align}
$$
In such a test we either reject $H_0$ in favour of $H_a$ if it's unlikely the data have arisen in the case
the null hypothesis $H_0$ is true, else we conclude we have insufficient evidence against $H_0$.

These conclusions are governed by the *significance level* $\alpha$, often taken to be $\alpha = 0.05$, which is the probability of concluding that the null hypothesis $H_0$ is false when it is in fact true, a Type I error.

A related probability is the Type II error, the probability that we fail to reject the null hypothesis when the alternate
$H_a$ is true (for a particular value of $\mu_a$). This is given by $\beta$ and is related to the *power* of the test, which
is $1-\beta$.

Each of these probabilities are related. The power of the test depends on the significance level $\alpha$, the sample size $n$, and the *effect size*
$$
d = \frac{\mu_a - \mu_0}{\sigma},
$$
which is the magnitude of the difference between the two hypothesised means $\mu_0$ and $\mu_1$ compared to the amount of variation $\sigma$ in the population.
