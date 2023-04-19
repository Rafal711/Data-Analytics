
generated quantities {
   real<lower=0.0> alpha = normal_rng(2.25, 0.7);
   real<lower=0.0> theta = normal_rng(0.21, 0.01);
   real<lower=0.0> ni = normal_rng(5.5, 0.9);

   real<lower=0.0> lambda = exp(alpha + theta * ni);
   int yi = poisson_rng(lambda);
}
