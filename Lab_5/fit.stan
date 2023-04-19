data {
   int N; //number of years
   vector[N] n; // miles flown
   int y[N]; // number of accidents
}

parameters {
   real alpha;
   real theta;
}

transformed parameters {
   vector[N] lambda = exp(alpha + theta * n);
}

model {
   alpha ~ normal(2.25, 0.7);
   theta ~ normal(0.21, 0.01);

   for (i in 1:N) {
      y[i] ~ poisson(lambda[i]);
   }
}

generated quantities {
   real y_pred[N];
   for (i in 1:N) {
    y_pred[i] = poisson_rng(lambda[i]);
   }
}
