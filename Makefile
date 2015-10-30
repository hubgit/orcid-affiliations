.PHONY: all

DIR := data

all: $(DIR)/organizations.zip

$(DIR)/public_profiles.tar.gz:
	wget 'http://files.figshare.com/2369121/orcid_data_dump.tar' -O $(DIR)/public_profiles.tar.gz

$(DIR)/json: | $(DIR)/public_profiles.tar.gz
	tar -xzf $(DIR)/public_profiles.tar.gz --wildcards "./json/*" -C $(DIR)

$(DIR)/json-files.txt: | $(DIR)/json
	find $(DIR)/json -name "*.json" > $(DIR)/json-files.txt

$(DIR)/organizations.json: | $(DIR)/json-files.txt
	php extract-organizations.php $(DIR)/json-files.txt

$(DIR)/organizations.csv: | $(DIR)/organizations.json
	php convert-to-csv.php $(DIR)/organizations.json

$(DIR)/organizations-sorted.csv: | $(DIR)/organizations.csv
	sort $(DIR)/organizations.csv > $(DIR)/organizations-sorted.csv

$(DIR)/organizations-unique.csv: | $(DIR)/organizations.csv 
	uniq $(DIR)/organizations-sorted.csv > $(DIR)/organizations-unique.csv

$(DIR)/organizations.zip: | $(DIR)/organizations-sorted.csv $(DIR)/organizations-unique.csv
	zip $(DIR)/organizations.zip $(DIR)/organizations-sorted.csv $(DIR)/organizations-unique.csv

