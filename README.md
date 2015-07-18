# orcid-affiliations

Run `make all` to fetch the ORCID public data file and parse all the JSON files for affiliations, resulting in a CSV file.

There are two pre-built CSV files: [all affiliations](https://github.com/hubgit/orcid-affiliations/blob/master/data/organizations-sorted.csv?raw=true) and [only unique affiliations](https://github.com/hubgit/orcid-affiliations/blob/master/data/organizations-unique.csv?raw=true).

Disambiguation with Google Refine is possible but slow, as the most commonly-used affiliation names are "incorrect" (they tend to omit accented characters).
