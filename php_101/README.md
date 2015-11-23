Langages de programmation 2 - PHP 101
=====

Le but de cette partie du cours est de fournir les bases de PHP, en terme de syntaxe et de logique.

1 - Qu'est ce que PHP ?
-------

[PHP](http://www.php.net) est un language de programmation, principalement utilisé afin de créer des sites ou applications web.

*Exemple d'un petit programme PHP:*

```php
<?php
$message = 'Hello world!";

echo '<p>'.$message.'</p>';
```

PHP n'est pas en lui même un serveur web, c'est à dire qu'il n'écoute ni ne répond aux requêtes HTTP qui lui sont adressées. Dans notre cours, nous utilisons [Apache](http://www.apache.org).

Le rôle d'Apache est d'écouter les requêtes HTTP, formulées par les navigateurs web de visiteurs, puis, soit de directement s'en occuper et transmettre le fichier demandé — dans le cas d'une image par exemple — ou alors de transmettre à PHP, afin que celui-ci s'execute et retourne une réponse.

2 - La syntaxe de PHP
---------------

Le code PHP est toujours entouré de balises d'ouverture et de fermeture

```php
<?php
    // Ici le code PHP
?>
```

Remarque: si la balise de fermeture est la dernière chose avant la fin du fichier, elle est alors optionnelle. 

Afin d'afficher quelque chose, on utilise la fonction `echo` :

```php
<?php

echo 'Hello world!';
echo '<br>';
echo 13;
echo '<br>';
echo '13';
echo '<br>';
echo 16.64;
echo '<br>';
echo 2 + 9; 
echo '<br>;
// je suis un commentaire

echo 3 * 4; // 12
echo '<br>';
echo 100 / 3; // 33.33333333
```

*Résultat affiché :*

```
Hello world!
13
13
16.64
11
12
33.3333333333
```

### 2.1 Les variables

Une variable est une valeur nommée, qui peut (ou non) changer au cours de l'execution d'un programme. 

On peut visualiser une variable comme une boite avec nom, dans laquelle on stocke quelque chose, pour pouvoir ensuite le récupérer plus tard, lorsqu'on en a besoin.

En PHP, une variable est toujours préfixé par le caractère `$`.

```php
<?php
$firstname = 'John';

$x = 13;
$y = 10;
```

Il est possible d'utiliser un variable pour en définir une autre :

```php
<?php
$x = 13;
$y = 10;
$sum = $x + $y; // 23
```

L'affectation des variable est instantanée, et exécutée sur le champ. Ce n'est pas une déclaration d'égalité au sens mathématique.

```php
<?php
$x = 13;
$y = 10;
$sum = $x + $y; // 23

$x = 6;

echo $sum; // Toujours 23 (et non pas 19)
```

2.2 Les types de données
----------

Il existe plusieurs types de données :

### 2.2.1 Nombre

Sert à représenter une valeur numérique, entière ou non.

```php
<?php
$x = 3;
$y = 3.1416;
```

### 2.2.2 Chaine de caractères

Sert à représenter des mots, des phrases, c'est à dire **une suite de caractères d'imprimerie** (d'où son nom).

```php
<?php
$prenom = 'Clément';
$nom = "Herreman";
```

Une chaine de caractère est entourée de quotes, simple `'` ou doubles `"`.

### 2.2.3 Tableau

Un tableau, appelé `array` en PHP, est destiné à recevoir un ensemble de données. On l'utilise pour stocker par exemple une liste de mois, une liste de nombres, etc.

```php
<?php
$listeDeFruit = array('Pomme', 'Banane', 'Fraise');
```

On accède à un élément d'un tableau grace à la notation `$tableau[index]` :

```php
<?php
$listeDeFruit = array('Pomme', 'Banane', 'Fraise');
$pomme = $listeDeFruit[0];
echo $listeDeFruit[1]; // Affiche "Banane"
// Etc.
```

**Note:** on commence à l'index `0`, et non pas `1`.

On peut ajouter des éléments à un tableau déjà créé :

```php
<?php
$listeDeFruit = array('Pomme', 'Banane', 'Fraise');

$listeDeFruit[] = 'Kiwi';

echo $listeDeFruit[3]; // Affiche "Kiwi"
```

3. Les conditions
-----------

Une condition sert à effectuer des choses différents en fonctions de certaines données. Exemples :

> Afficher "Boite aux lettres pleines", lorsqu'il y a plus de 50 emails dedans

> Afficher "Bonjour Madame" ou "Bonjour Monsieur" en fonction du genre du visiteur. Sinon, afficher simplement "Bienvenue".

Une condition, en PHP, utilise le mot clef `if`, et est toujours composée des mêmes éléments :

```
if (condition)
{
    bloc de code executée si la condition est vraie
}
```

Exemple en PHP :

```php
<?php
$nombre = 5; // Ou un autre nombre

if ($nombre < 4)
{
    echo 'Le nombre est relativement petit';
}
```

Ici `Le nombre est relativement petit` sera affiché si `$nombre` est strictement inférieur à `4`.

### 3.1 Sinon si

Il est possible d'examiner plusieurs fois une variable :

```php
<?php
$nombre = 5; // Ou un autre nombre

if ($nombre < 4)
{
    echo 'Le nombre est relativement petit';
} 
else if ($nombre < 10) 
{
    echo 'Le nombre est moyen';
}
```

Dans notre exemple, `Le nombre est plutôt grand` sera affiché si `$nombre` n'est pas inférieur à `4` **et qu'il est supérieur à `10`**.

### 3.2 Sinon

Il est possible d'effectuer un traitement par défaut, si aucune condition n'est remplie, via le mot clef `else`.

```php
<?php
$nombre = 5; // Ou un autre nombre

if ($nombre < 4)
{
    echo 'Le nombre est relativement petit';
} 
else if ($nombre > 10) 
{
    echo 'Le nombre est plutôt grand';
} 
else 
{
    echo 'Le nombre est plutôt moyen';
}
```

Ici, `Le nombre est plutôt moyen` sera affiché si `$nombre` est ni inférieur à `4`, ni supérieur à `10`.


4. Les boucles
----------

Une boucle consiste à exécuter un même traitement, un nombre variable de fois, ce nombre changeant selon une condition.

### 3.1 Boucle `while`

La boucle `while` est une boucle **qui s'exécute tant qu'une condition est vraie**. Sa syntaxe est similaire au `if`, mais utilise le mot clef `while`. Il n'y cependant pas d'équivalent du `else`, forcément.

> Tant qu'il reste du gateau, j'en mange une part

```php
<?php
$brownieParts = 8;

while ($brownieParts > 0)
{
    echo 'Nom nom nom... <br>';

    $brownieParts = $brownieParts - 1;
}
```

On se sert de ce type de boucle pour effectuer une action, un nombre de fois indéterminé.

### 3.2 Boucle `foreach`

Une boucle `foreach` est une boucle qui s'exécute **pour chacun des éléments d'un tableau**. Le but est d'effectuer un traitement sur chacun des éléments d'une liste. Exemple :

> Envoyer un email à chaque étudiant du master

> Afficher chaque mois de la liste

```php
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
	echo $leMois; // Affiche "January", puis "February", etc.
}
```

