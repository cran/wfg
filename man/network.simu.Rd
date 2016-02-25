\name{network.simu}
\alias{network.simu}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Simulation of Networks with Community Structures
}
\description{
Simulation of networks under the framework by Girvan and Newman. The vertices are connected with each other randomly and independents with probability p.in (within same community) and p.out (between communities).
}
\usage{
network.simu(nv = c(32, 32, 32, 32),
  p.in = c(0.323, 0.323, 0.323, 0.323),
  p.out = 0.0625, p.del = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nv}{
a vector of community sizes. The number of communities equals the number of elements in this vector.
}
  \item{p.in}{
a vector of probability of a node to be randomly linked to other nodes in the same community.
}
  \item{p.out}{
the probability of a node to be randomly linked to nodes in other communities.
}
  \item{p.del}{
the proportion of links that are randomly deleted.
}
}

\value{

\item{net}{ The simulated network. }
\item{ group }{ The membership of vertices. }

}
\references{
Girvan, Michelle, and Mark EJ Newman. "Community structure in social and biological networks." Proceedings of the national academy of sciences 99.12 (2002): 7821-7826.
}
\author{
 Han Yu & Rachael Hageman Blair
}

\examples{

## simulation of a network with four communities, each with size 32

library(wfg)
nv = c(32, 32, 32, 32)
p.in = c(0.452, 0.452, 0.452, 0.452)
p.out = 0.021
p.del = 0
net.simu <- network.simu(nv=nv, p.in=p.in, p.out=p.out, p.del=p.del)
net <- net.simu$net
group <- net.simu$group

## plot simulated network with vertices colored by membership

V(net)$size <- 7
V(net)$color <- group
plot(net, vertex.label='')

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
