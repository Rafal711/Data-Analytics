
data {
    int<lower=0> N;
    real heights[N];
}

parameters {
    real mu;
    real sigma;
}

model {
    mu ~ normal(165, 20);
    sigma ~ exponential(0.067);
    heights ~ normal(mu, sigma);
}

generated quantities {
   real height = normal_rng(mu, sigma);
}
