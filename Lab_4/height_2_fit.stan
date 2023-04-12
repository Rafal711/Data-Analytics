
data {
    int<lower=0> N;
    real heights[N];
    vector[N] weight;
}

parameters {
    real alpha;
    real beta_;
    real<lower=0> sigma;
}

transformed parameters {
   vector[N] mu = alpha + beta_ * weight; 
}

model {
    alpha ~ normal(165, 20);
    beta_ ~ lognormal(0, 1);
    sigma ~ exponential(0.067);
    heights ~ normal(mu, sigma);
}

generated quantities {
   real height[N];
   for (i in 1:N) {
    height[i] = normal_rng(mu[i], sigma);
   }
}
