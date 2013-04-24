ngresponsiveimages
==========================

This extension use picturefill.js as a base for loading different image sizes.

## Usage ##

```php
{attribute_view_gui attribute=$node.data_map.image image_class=default responsive}
```

## Options ##

* __image_class__ - fallback for browsers without jscript
* __responsive__ - activate image responsiveness


## ngimage.ini ##
In ngimage.ini you need to map the responsive classes with the imagealiases in you ezpublish installation, and min width when current image alias will be used. In this example desktop alias will be used for resolution greather 767px.

```php
[Responsive]
Class[]
Class[]=Desktop

[Desktop]
ImageAlias=desktop
MinWidth=768
```

## Notice ##
__This extension creates 4 additional imageAliases (default, desktop, tablet and mobile).__
You can map your own aliases and delete image.ini.append.php from this extension.

## Author ##

Mario Ivančić
