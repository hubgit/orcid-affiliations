<?php

$dir = dirname($argv[1]);
$input = fopen($argv[1], 'r');
$output = fopen($dir . '/organizations.csv', 'w');

//fputcsv($output, ['name', 'city', 'region' , 'country', 'identifier', 'source']);

while (($line = fgets($input)) !== false) {
	$data = json_decode(trim($line), true);

//	if (!$data['disambiguated-organization']) continue;

        fputcsv($output, [
		$data['disambiguated-organization']['disambiguation-source'],
		$data['disambiguated-organization']['disambiguated-organization-identifier'],
		$data['name'],
		$data['address']['city'],
		$data['address']['region'],
		$data['address']['country'],
	]);
}
