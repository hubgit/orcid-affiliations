<?php

$dir = dirname($argv[1]);
$input = fopen($argv[1], 'r');
$output = fopen($dir . '/organizations.json', 'w');

while (($file = fgets($input)) !== false) {
	$data = json_decode(file_get_contents(trim($file)), true);
	$affiliations = $data['orcid-profile']['orcid-activities']['affiliations']['affiliation'];

	if (!$affiliations) continue;

	foreach ($affiliations as $aff) {
		fwrite($output, json_encode($aff['organization']) . "\n");
	}
}
