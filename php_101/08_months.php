<?php
$allMonths = array(
	'January',
	'February',
	'March',
	'April',
	'May',
	'June',
	'July',
	'August',
	'September',
	'October',
	'November',
	'December'
);

foreach ($allMonths as $leMois)
{
	echo $leMois;
}


$counter = 0;
$nbMonths = count($allMonths);
while($counter < $nbMonths)
{
	echo $allMonths[$counter].'<br>';

	$counter = $counter + 1;
}
