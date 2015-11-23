<?php 

$counter = 0;
$number = $_GET['numero_de_table'];

while ($counter <= 10)
{
    $result = $counter * $number;

    echo '<p>'.$counter.' x '.$number.' = '.$result.'</p>';

    $counter = $counter + 1 ;
}