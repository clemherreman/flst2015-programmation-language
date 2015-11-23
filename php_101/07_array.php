<?php

$nombre = 4;
$pi = 3.1415;
$prenom = 'Clement';

$listeDeFruit = array('Pomme', 'Banane', 'Fraise');

echo "Les fruits que j'aime : <br>";

$listeDeFruit[3] = 'Tomate';
$listeDeFruit[] = 'Papaye'; // $listeDeFruit[4] == 'Papaye'
$listeDeFruit[2] = 'Kiwi';


$counter = 0;
$nombreDeFruits = count($listeDeFruit);

while($counter < $nombreDeFruits)
{
	echo $listeDeFruit[$counter].'<br>';

	$counter = $counter + 1;
}










