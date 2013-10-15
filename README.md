Netgen Responsive Images
========================

This extension uses [`picturefill.js`](https://github.com/scottjehl/picturefill) v1.2.0 as a base for loading different image sizes.

- - -

## Usage 1st case: ##
```ini
# ngresponsive.ini
AlwaysResponsive=disabled
```
```
# full/article.tpl
...
{attribute_view_gui attribute=$node.data_map.image responsive_image_class=imagefull}
...
```
This use case **requires** that we **change the template files** and setup **ngresponsiveimages.ini** and **image.ini** file.

## Usage 2nd case: ##
```ini
# ngresponsive.ini
AlwaysResponsive=enabled
```
```
# full/article.tpl
...
{attribute_view_gui attribute=$node.data_map.image image_class=imagefull [responsive_disabled]}
...
```
This case allows you to override image aliases **without** need to **change the template files**. Everything you need to do is to setup **ngresponsiveimages.ini** and **image.ini** file to your needs.

## Options ##

* `image_class` - standard image_alias. This image is not responsive unless AlwaysResponsive is set to enabled
* `responsive_image_class` - Responsive image alias. This image alias uses picturefill html output
* `responsive_disabled` - deactivate image responsiveness for current attribute(not for image alias)


## ngresponsiveimages.ini ##
In `ngresponsiveimages.ini`, you need to define the responsive breakpoints with media query expressions.
```ini
[Responsive]
MediaQueryExpressions[]
MediaQueryExpressions[desktop]=(min-width: 768)
```
After that you need to create the group in ngresponsiveimages.ini file for each image alias in your eZ Publish installation that you would like to make responsive.

In the following example, `imagefull` image alias will be replaced with `alias_768_3_2`  on the desktop screen and for the mobile screen `default_alias` will be used because we didn't specified mapping for mobile screen `MediaQueryMappings[mobile]`:

```ini
[Responsive]
MediaQueryExpressions[]
MediaQueryExpressions[mobile]=(min-width: 480px)
MediaQueryExpressions[desktop]=(min-width: 768)

[imagefull]
DefaultMap=default_alias
MediaQueryMappings[]
MediaQueryMappings[desktop]=alias_768_3_2
```
This will output next html for **imagefull** alias:
```html
<span data-picture data-alt="some alt text">
    <span data-src="default_alias.jpg"></span>
    <span data-src="desktop.jpg" data-media="(min-width: 768px)"></span>

    <!-- Fallback content for non-JS browsers. -->
    <noscript>
        <img src="imagefull.jpg" alt="some alt text">
    </noscript>
</span>
```

#### Other aliases (eg. large, medium, small) will be intact because we didn't defined INI group for the.
## Installation instructions ##

* Activate the extension

* Copy and uncomment image aliases from provided example `image.ini` to `image.ini` in your project extension. You can ofcouse map your own image aliases instead of using the example ones.

* Copy `ngresponsiveimages.ini` INI file to `ngresponsiveimages.ini.append.php` in your project extension and configure image aliases and responsive breakpoints to suit your needs.

## Author ##

Netgen & Mario Ivančić
