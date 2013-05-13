Netgen Responsive Images
========================

This extension use picturefill.js as a base for loading different image sizes.

**URL:** [https://github.com/scottjehl/picturefill](https://github.com/scottjehl/picturefill)

- - -

## Usage ##

```
{attribute_view_gui attribute=$node.data_map.image image_class=default responsive}
```

## Options ##

* `image_class` - fallback for browsers without javascript
* `responsive` - activate image responsiveness


## ngresponsiveimages.ini ##
In `ngresponsiveimages.ini`, you need to map the responsive classes to the image aliases in you eZ Publish installation. You also need to define the minimum width when the current image alias will be used.

In the following example, desktop alias will be used for resolutions greater than 767px:

```ini
[Responsive]
Class[]
Class[]=Desktop

[Desktop]
ImageAlias=desktop
MinWidth=768
```

## Installation instructions ##

* Activate the extension

* Copy and uncomment image aliases from provided example `image.ini` to `image.ini` in your project extension. You can ofcouse map your own aliases instead of using the example ones.

* Copy `ngresponsiveimages.ini` INI file to `ngresponsiveimages.ini.append.php` in your project extension and configure image aliases and responsive breakpoints to suit your needs.

## Author ##

Netgen & Mario Ivančić
