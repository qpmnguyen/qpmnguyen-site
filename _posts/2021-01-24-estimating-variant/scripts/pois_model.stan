
// The input data is a vector counts of length N.
// The predictor is the dod (days since diagnosis)  
// Having the offset variable  
data {
  int<lower=0> N;
  int counts[N]; // This is the outcome 
  vector[N] dod; // This is the dod 
  vector[N] offset; // This is the offest variable 
}

// Two main parameters which is the beta parameter and the intercept
parameters {
  real alpha;
  real beta;
}

// This is a transformed 
transformed parameters {
  vector[N] mu;
  mu = alpha + beta * square(dod) + log(offset);
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  alpha ~ normal(0, 2.5);
  beta ~ normal(0,0.005);
  counts ~ poisson_log(mu); 
}

