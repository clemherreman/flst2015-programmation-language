<?php

$coordonnees = array(
	'nom' => 'Rizomm',
    'numero' => 41,
    'rue' => 'rue du port',
    'ville' => 'Lille'
);

echo $coordonnees['nom'].'<br>'; // 'Rizomm'
echo $coordonnees['numero'].'<br>'; // 41

$coordonnees['code_postal'] = '59000';

echo $coordonnees['code_postal'].'<br>';