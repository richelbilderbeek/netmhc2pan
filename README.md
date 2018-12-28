# netmhc2pan

Branch|[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)|[![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---|---|---
master|[![Build Status](https://travis-ci.org/richelbilderbeek/netmhc2pan.svg?branch=master)](https://travis-ci.org/richelbilderbeek/netmhc2pan)|[![codecov.io](https://codecov.io/github/richelbilderbeek/netmhc2pan/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/netmhc2pan/branch/master)
develop|[![Build Status](https://travis-ci.org/richelbilderbeek/netmhc2pan.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/netmhc2pan)|[![codecov.io](https://codecov.io/github/richelbilderbeek/netmhc2pan/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/netmhc2pan/branch/develop)

R package for [NetMHCIIpan](http://www.cbs.dtu.dk/services/NetMHCIIpan/) [1].

## Supported operating systems

 * Linux
 * Mac (future)
 * Windows (never, as NetMHCIIpan does not support Windows)

## Install

```
usethis::install_github("richelbilderbeek/netmhc2pan")
```

Install NetMHCIIpan to a default folder:

```
library(netmhc2pan)
install_netmhc2pan()
```

## Usage

We need a FASTA file:

```
fasta_file <- system.file("extdata", "example.fas", package = "netmhc2pan")
```

Calling `netmhc2pan_run` will do the NetMHC2pan analysis:

```
df <- netmhc2pan_run(fasta_file)
```

The data frame `df` contains the results.

## References

 * [1] Improved methods for predicting peptide binding affinity to MHC class II molecules.
   Jensen KK, Andreatta M, Marcatili P, Buus S, Greenbaum JA, Yan Z, Sette A, Peters B, Nielsen M.
   Immunology. 2018 Jan 6. doi: 10.1111/imm.12889.
   PubMed: [29315598](http://www.ncbi.nlm.nih.gov/pubmed/29315598)
