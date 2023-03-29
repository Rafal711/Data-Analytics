generated quantities {
   int<lower=0> N = 50; // Number of trials
   real<lower=0,upper=1> p = normal_rng(0.2, 0.07); // probability of allergic reaction
   int y = binomial_rng(N, p); // number of successes
}
