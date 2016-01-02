Langages de programmation 2 - PHP 102
=====

Le but de cette partie du cours est de montrer une utilisation plus avancée de PHP, permettant de créer des programmes simples.

1 - Les fonctions
-------

Une fonction est une série d'instruction, portant un nom, pouvant réclamer des paramètres et retourner un résultat.

Une fonction peut être vue comme une *"boite noire"* ou une *"machine"*, qui accomplit un travail fixe et vous donne un résultat, à condition de lui donner les éléments (*les "paramètres"*) qu'elle réclame afin de mener à bien son travail.

Une fonction s'utilise en **deux parties** : la **déclaration**, et l'**appel**.

La **déclaration** consiste à expliquer à PHP 

1. qu'une fonction, nommée X ou Y, existe
2. qu'elle nécessite (ou non) les paramètres A, B et C, 
3. en quoi la fonction consiste, c'est à dire qu'est ce que PHP doit faire quand on l'appelle

L'**appel** consiste à appeler la fonction, en lui passant les valeurs des paramètres qu'elle attend, puis à récupérer le résultat qu'elle retourne.

Exemple d'une déclaration d'une fonction appelée `cube`, qui retourne le cube d'un nombre qui lui est passé :

```php
function cube($nombre)
{
    return $nombre * $nombre * $nombre;
}
```

Voici un exemple d'appel de cette fonction

```php
$x = cube(3); // $x == 9

$y = cube($x) // $y == 729;
```

Un autre exemple de fonction, servant à retourner une chaine de caractère, e.g. transformer `La Catho` en `ohtaC aL`.

```php
function inverser($chaine)
{
    $index = strlen($chaine) - 1;
    $reversedString = '';
    
    while ($index >= 0)
    {
        $reversedString = $reversedString.$chaine[$index];
        $index = $index - 1;
    }
    
    return $reversedString;
}
```

On peut également passer plusieurs paramètres si une fonction le réclame :

```php
function multiply($x, $y)
{
    return $x * $y;
}
```

2 - Communiquer d'une page à une autre
--------

### 2.1 Via des formulaires

Il est possible de récupérer ce qui à été tapé précédemment dans les formulaire HTML. Le lien entre formulaire HTML et page PHP se fait via des attributs HTML bien précis :

* `action="..."` de la balise `<form>`

Cet attribut `action` sert à spécifier vers quelle page sera transmis ce qui a été saisi, lorsque le formulaire sera soumis.

* `name="..."` des balises `<input>`

Ce nom permettant, dans PHP, d'accéder à telle ou telle valeur du formulaire, via des variables spéciales, nommées `$_GET` et `$_POST`. 

Nous allons voir la différence entre les deux.

#### Exemple de formulaire :

* `formulaire.php`

```html
<form action="cible.php" method="get">
    <input type="text" name="mon_nom" />
    <input type="submit" />
</form>
```

* `cible.php`

```php
<?php

echo 'Vous venez de saisir : ';
echo $_GET['mon_nom'];
```

#### `POST` vs `GET`

`POST` et `GET` sont des verbes HTTP. Ils désignent deux manières de transmettre des données vers une page web.

La différence principale est que `GET` transmet les informations en les plaçant dans l'URL, alors que `POST` les place dans le corps de la requête HTTP.

Nous utiliserons le formulaire suivant comme exemple

```html
<form action="cible.php" method="get">
    <input type="text" name="prenom" />
    <input type="text" name="age" />
    <input type="submit" />
</form>
```

L'utilisateur ayant saisi respectivement `Clement` et `26` dans le formulaire.

##### `GET`

`GET` place les données dans **l'URL** afin de les transmettre. En utilisant l'exemple précédent, après remplissage et soumission du formulaire, on arriverait vers l'URL `/cible.php?prenom=Clement&age=26`.

Notez la manière dont les paramètre sont *encodés* dans l'URL sous la forme **cle**=**valeur**. Ces paires clé/valeur sont mis les unes à la suite des autres avec le symbole `&`.

L'ensemble de la chaine `?prenom=Clement&age=26` est appelé une *query string*.

###### Les avantages de `GET`

* Tout ce qui a été saisi dans le formulaire est présent dans l'URL.

Cela permet de transmettre tout via un copier coller. Un exemple concret est un formulaire de recherche, type Google, ou en fournissant l'URL de la page où vous êtes, vous êtes certain que le destinataire verra la même chose que vous.

##### `POST`

`POST` place les données dans le corps de la requête afin de les transmettre. Toujours avec l'exemple précédent, la requête HTTP ressemblerait à ceci :

```
POST /cible.php HTTP/1.0
User-Agent: Chromzillaxplorer
Content-Type: application/x-www-form-urlencoded

prenom=Clement&age=26
```

Notez que la *query string* est toujours présente, mais cette fois dans le corps, et non plus dans l'URL (celle-ci restant tout simplement `cible.php`).

**Remarque**: en utilisant `POST`, on n'accède pas à ce qui a été saisi en PHP via `$_GET`, mais via `$_POST`.

###### Les avantages de `POST`

* Tout ce qui a été saisi dans le formulaire n'est pas présent dans l'URL.

Cela peut sembler paradoxal, au vue des avantages de `GET`. Cependant, il y a de nombreux exemple où l'on ne souhaite pas que ce qui a été saisi soit présent dans l'URL : formulaire d'identification, formulaire de paiement avec numéro de carte de paiement, etc.

Cela permet qu'une donné publique, visible (et souvent archivée dans l'historique de navigation) telle que l'URL soit exempte de données considérée comme sensible.