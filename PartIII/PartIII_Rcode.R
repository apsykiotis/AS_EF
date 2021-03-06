#First we are going to set up probability distributions for our beliefs about the inputs
#We've been told ARPU is about £7 and it's very unlikely to be higher than £10 or lower than £4
#So we'll go for a normal distribution centred at 7 with 5% and 95% quantiles at 4 and 10

#Show how we get the variance

arpu.sd<-3/1.96
x<-seq(0, 15,by=0.5)
d<-dnorm(x, 7, arpu.sd)
plot(x, d, type='l')

#Do the same for acquisition and churn

acq.sd<-0.02/1.96
x<-seq(0, 0.2,by=0.001)
d<-dnorm(x, 0.05, acq.sd)
plot(x, d, type='l')

ch.sd<-0.01/1.96
x<-seq(0, 0.2,by=0.001)
d<-dnorm(x, 0.02, ch.sd)
plot(x, d, type='l')

#I'm to lazy to do the maths for this so I'll write a function

#Define number of customers for simulation
n.cust<-50000

# Calculate yearly revenues taking into account aquisition rate and churn rate.
revenue<-function(arpu, acq, ch, n.cust){
  
  num.cust<-n.cust
  
  for (m in 1:12){
    
    num.cust<-num.cust+acq*num.cust-ch*num.cust
  }
  
  return(num.cust*arpu)
  
}

#Now let's simulate 10k values from each of our distributions

sim.arpu<-rnorm(10000, 7, arpu.sd)
sim.acq<-rnorm(10000, 0.05, acq.sd)
sim.ch<-rnorm(10000, 0.02, ch.sd)

#We can then apply the function to these values to get a distribution for end of year revenue
#Calculate results for 10k combs for 50k customers

sim.rev<-mapply(revenue, sim.arpu, sim.acq, sim.ch,MoreArgs = list(n.cust))

summary(sim.rev)

hist(sim.rev)
plot(density(sim.rev))

#Note the distribution is slightly skewed 
