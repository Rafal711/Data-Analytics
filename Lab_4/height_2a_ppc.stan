
data {
   int<lower=0> N;
   real weight[N];
}


generated quantities {
   real alpha = normal_rng(165, 20);
   real beta_ = normal_rng(0, 10); 
   real sigma = exponential_rng(0.067);
   real height[N];
   for (i in 1:N) {
      height[i] = normal_rng(alpha + beta_ * weight[i], sigma);
   }
}
