\name{wfg}
\alias{wfg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Weighted Fast Greedy Algorithm
}
\description{
  Implementation of weighted fast greedy algorithm for community detection in networks with mixed types of attributes.
}
\usage{
  wfg(net, attr=NULL, under.sample=FALSE, prioritize=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{net}{
  network for community detection
}
  \item{attr}{
  data frame of attribute information. The default value is NULL, when no attribute information will be used. Under default this method is identical to fast greedy community detection algorithm.
}
  \item{under.sample}{
  a boolean parameter. When it is TRUE, the vertex pairs without links will be under-sampled to have the same number as that of the linked pairs of vertices.
}
  \item{prioritize}{
  a boolean parameter. When it is TRUE, a matrix of cummunity-specific coefficients will be returned, by which the communities can be prioritized.
}

}
\details{
  Each column of attr data frame can be a vector with type of either numeric (continuous) or factor (categorical). The matrix of cummunity-specific coefficients gives estimates as to the relative homogeneity of each attribute within each community. Specifically, a negative beta with large absolute value indicates corresponding attribute is homogeneous.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{beta}{Estimates of coefficients from logistic regression.}
\item{beta.matrix}{Estimates of community specific coefficients.}
\item{memb}{Community membership of vertices.}
}
\references{
  Clauset, Aaron, Mark EJ Newman, and Cristopher Moore. "Finding community structure in very large networks." Physical review E 70.6 (2004): 066111.
}
\author{
Han Yu & Rachael Hageman Blair
}

\examples{

##### implementation of wfg on a computer generated network with
##### structually relevant continuous attribute and irrelevant categorical attribute
set.seed(7)
##### set network properties
## four groups, each with 32 vertices
nv <- c(32,32,32,32)
l <- length(nv)
## obtain p.in and p.out from z.out
z.out <- 6
z.in <- 16-z.out
p.out <- z.out/96
p.in <- rep(z.in/31, l)

##### simulate network
net.simu <- network.simu(nv=nv, p.in=p.in, p.out=p.out, p.del=0)
net <- net.simu$net
group <- net.simu$group

##### simulate attributes
## separation of continuous attribute
delta <- 1
## p's for the multinomial distribution of categorical attributes
p1 <- 0.25
p2 <- (1-p1)/3
attr1 <- c(rnorm(nv[1],0), rnorm(nv[2],1*delta), rnorm(nv[3],2*delta), rnorm(nv[4],3*delta))
attr2 <- c(sample(c(1,2,3,4), size=nv[1], prob=c(p1, p2, p2, p2), replace=TRUE),
           sample(c(1,2,3,4), size=nv[2], prob=c(p2, p1, p2, p2), replace=TRUE),
           sample(c(1,2,3,4), size=nv[3], prob=c(p2, p2, p1, p2), replace=TRUE),
           sample(c(1,2,3,4), size=nv[4], prob=c(p2, p2, p2, p1), replace=TRUE))
attributes <- data.frame(attr1, attr2)

##### implementation of wfg
wfg.result <- wfg(net=net, attr=attributes, under.sample = FALSE, prioritize = TRUE)

##### plot network colored by wfg result
V(net)$size <- 7
V(net)$color <- wfg.result$memb
plot(net, vertex.label='')

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
