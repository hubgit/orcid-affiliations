# orcid-affiliations

Run `make all` to fetch the [ORCID public data file](http://dx.doi.org/10.14454/07243.2014.001) and parse all the JSON files for affiliations, resulting in a CSV file.

There are two pre-built CSV files: [all affiliations](https://github.com/hubgit/orcid-affiliations/blob/master/data/organizations-sorted.csv?raw=true) and [only unique affiliations](https://github.com/hubgit/orcid-affiliations/blob/master/data/organizations-unique.csv?raw=true).

Disambiguation with Google Refine is possible but slow, as the most commonly-used affiliation names are "incorrect" (they tend to omit accented characters).

## License

Like the source data, this repository is published under the [Creative Commons CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

## Data source

Paglione, Laura, Robert Peters, Catalina Oyler, Will Simpson, Angel Montenegro, José Francisco Ramírez Monge, Elizabeth Krznarich, Josh Brown, Laurel Haak; (2014); ORCID Annual Public Data File, 2014; ORCID, Inc. http://dx.doi.org/10.14454/07243.2014.001
