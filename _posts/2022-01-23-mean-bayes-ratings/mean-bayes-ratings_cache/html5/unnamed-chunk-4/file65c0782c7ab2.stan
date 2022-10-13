data {
    int<lower=1> N; // Number of data
    vector[N] y; // the mean variable
}

parameters {
    real mu;
    real<lower=0> sigma;
}

model {
    mu ~ normal(0,1);
    sigma ~ exponential(1);
    y ~ normal(mu, sigma);
}


