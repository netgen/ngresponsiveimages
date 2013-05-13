Netgen Responsive Images
========================

This extension use picturefill.js as a base for loading different image sizes.

**URL:** [https://github.com/scottjehl/picturefill](https://github.com/scottjehl/picturefill)

- - -

## Usage ##

```php
{attribute_view_gui attribute=$node.data_map.image image_class=default responsive}
```

## Options ##

* __image_class__ - fallback for browsers without jscript
* __responsive__ - activate image responsiveness


## ngresponsiveimages.ini ##
In ngresponsiveimages.ini you need to map the responsive classes with the image aliases in you eZ Publish installation, and min width when current image alias will be used. In this example desktop alias will be used for resolution greater than 767px.

```php
[Responsive]
Class[]
Class[]=Desktop

[Desktop]
ImageAlias=desktop
MinWidth=768
```

## Notice ##
__This extension creates 4 additional image aliases (default, desktop, tablet and mobile).__
You can map your own aliases and delete image.ini.append.php from this extension.

## Author ##

Mario Ivančić
