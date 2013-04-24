ngresponsiveimages
==========================

This extension use picturefill.js as a base for loading different image sizes.

## Usage ##

```php
{attribute_view_gui attribute=$node.data_map.image image_class=highlighted responsive}
```

## Options ##

* __image_class__ - ezpublish image alias for browsers without jscript
* __responsive__ - with this we activate image responsiveness


## ngimage.ini ##
In ngimage.ini you need to map the responsive classes with the imagealiases in you ezpublish installation. And min width when this alias will be used.

```php
[Responsive]
Class[]
Class[]=Desktop

[Desktop]
ImageAlias=desktop
MinWidth=768
```

## Warning ##
This extension creates 4 additional imageAliases (default, desktop, tablet and mobile). You can map your own aliases and delete image.ini.append.php from this extension.

## Author ##

Mario Ivančić
