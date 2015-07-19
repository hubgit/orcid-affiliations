.PHONY: all

DIR := data

all: $(DIR)/organizations.zip

$(DIR)/public_profiles.tar.gz:
	wget 'http://74804fb637bd8e2fba5b-e0a029c2f87486cddec3b416996a6057.r3.cf1.rackcdn.com/public_profiles.tar' -O $(DIR)/public_profiles.tar.gz

$(DIR)/json: | $(DIR)/public_profiles.tar.gz
	tar -xzf $(DIR)/public_profiles.tar.gz --wildcards "$(DIR)/json/*"

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

