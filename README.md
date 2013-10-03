Netgen Responsive Images
========================

This extension uses [`picturefill.js`](https://github.com/scottjehl/picturefill) v1.2.0 as a base for loading different image sizes.

- - -

## Usage ##

```
{attribute_view_gui attribute=$node.data_map.image image_class=imagefull responsive}
```

## Options ##

* `image_class` - fallback for browsers without javascript, this alias is used as key for OverrideImageAlias[] array (see in the example below)
* `responsive` - activate image responsiveness


## ngresponsiveimages.ini ##
In `ngresponsiveimages.ini`, you need to map the responsive breakpoints to image aliases in your eZ Publish installation. You also need to define the minimum width as a breakpoint for each of the screen sizes.

In the following example, `desktop` image alias will be used for resolutions greater than 767px for all image aliases except for `imagefull` alias which will be overriden with `campaign` alias on Desktop screen:

```ini
[Responsive]
Screen[]
Screen[]=Desktop

[Desktop]
ImageAlias=desktop
OverrideImageAlias[]
OverrideImageAlias[imagefull]=campaign
MediaQueryExpression=(min-width: 768px)
```

## Installation instructions ##

* Activate the extension

* Copy and uncomment image aliases from provided example `image.ini` to `image.ini` in your project extension. You can ofcouse map your own image aliases instead of using the example ones.

* Copy `ngresponsiveimages.ini` INI file to `ngresponsiveimages.ini.append.php` in your project extension and configure image aliases and responsive breakpoints to suit your needs.

## Author ##

Netgen & Mario Ivančić
