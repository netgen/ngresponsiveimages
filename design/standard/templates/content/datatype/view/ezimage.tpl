{* ngresponsiveimages image. *}
{*
Input:
 image_class - Which image alias to show, default is large
 css_class     - Optional css class to wrap around the <img> tag, the
                 class will be placed in a <div> tag.
 alignment     - How to align the image, use 'left', 'right' or false().
 link_to_image - boolean, if true the url_alias will be fetched and
                 used as link.
 href          - Optional string, if set it will create a <a> tag
                 around the image with href as the link.
 border_size   - Size of border around image, default is 0
*}
{default image_class=large
         css_class_wrapper=false()
         alignment=false()
         link_to_image=false()
         href=false()
         target=false()
         hspace=false()
         border_size=0
         border_color=''
         border_style=''
         margin_size=''
         alt_text=''
         title=''
         css_class=false()}
{*if is_set($responsive)}
{ezscript_require( array( 'matchmedia.js', 'picturefill.js' ) )}
    {if ezini_hasvariable('responsive', 'Class', 'ngimage.ini')}
        {def $bs_images = array()}
        {foreach ezini('responsive', 'Class', 'ngimage.ini') as $bs_class}
            {if and(ezini_hasvariable($bs_class, 'ImageAlias', 'ngimage.ini'), ezini_hasvariable($bs_class, 'MinWidth', 'ngimage.ini'))}
                {set $bs_images = $bs_images|append( hash($bs_class, hash(
                        'image_class', ezini($bs_class, 'ImageAlias', 'ngimage.ini'),
                        'min_width', ezini($bs_class, 'MinWidth', 'ngimage.ini') ) ) )}
                <div data-src={$image.url|ezroot} data-media="(min-width: 400px)"></div>

            {/if}
        {/foreach}
    {/if}
{/if}
{$bs_images|dump(show,3)*}
{*iz inija povuci responsive tipove*}
{*foreach*}
{*kreirati set-block sa slikama i fallback imageom*}
{*ispucati  dolje kod slike*}

{def $image_content = $attribute.content}

{if $image_content.is_valid}

    {if is_set($responsive)}
    {ezscript_require( array( 'matchmedia.js', 'picturefill.js' ) )}
        {if ezini_hasvariable('Responsive', 'Class', 'ngimage.ini')}
            {*def $bs_images = array()*}
            {set-block variable=$responsive_images}
            {foreach ezini('Responsive', 'Class', 'ngimage.ini') as $bs_class}
                {if ezini_hasvariable($bs_class, 'ImageAlias', 'ngimage.ini')}
                    {*set $bs_images = $bs_images|append( hash($bs_class, hash(
                            'image_class', ezini($bs_class, 'ImageAlias', 'ngimage.ini'),
                            'min_width', ezini($bs_class, 'MinWidth', 'ngimage.ini') ) ) )*}
                    <div data-src={$image_content[ezini($bs_class, 'ImageAlias', 'ngimage.ini')].url|ezroot}{if ezini_hasvariable($bs_class, 'MinWidth', 'ngimage.ini')} data-media="(min-width: {ezini($bs_class, 'MinWidth', 'ngimage.ini')}px)"{/if}></div>

                {/if}
            {/foreach}

            {/set-block}
        {/if}
    {/if}

    {def $image        = $image_content[$image_class]
         $inline_style = ''}

    {if $link_to_image}
        {set href = $image_content['original'].url|ezroot}
    {/if}
    {switch match=$alignment}
    {case match='left'}
        <div class="imageleft">
    {/case}
    {case match='right'}
        <div class="imageright">
    {/case}
    {case/}
    {/switch}

    {if $css_class_wrapper}
        <div class="{$css_class_wrapper|wash}">
    {/if}

    {if and( is_set( $image ), $image )}
        {if $alt_text|not}
            {if $image.text}
                {set $alt_text = $image.text}
            {else}
                {set $alt_text = $attribute.object.name}
            {/if}
        {/if}
        {if $title|not}
            {set $title = $alt_text}
        {/if}
        {if $border_size|trim|ne('')}
            {set $inline_style = concat( $inline_style, 'border: ', $border_size, 'px ', $border_style, ' ', $border_color, ';' )}
        {/if}
        {if $margin_size|trim|ne('')}
            {set $inline_style = concat( $inline_style, 'margin: ', $margin_size, 'px;' )}
        {/if}
        {if $href}<a href={$href}{if and( is_set( $link_class ), $link_class )} class="{$link_class}"{/if}{if and( is_set( $link_id ), $link_id )} id="{$link_id}"{/if}{if $target} target="{$target}"{/if}{if and( is_set( $link_title ), $link_title )} id="{$link_title|wash}"{/if}>{/if}
        {if is_set($responsive)}<div data-picture data-alt="{$alt_text|wash(xhtml)}">{$responsive_images}<noscript>{/if}

            <img src={$image.url|ezroot}{if $css_class} class="{$css_class}"{/if}{if $hspace} hspace="{$hspace}"{/if} style="{$inline_style}" alt="{$alt_text|wash(xhtml)}" title="{$title|wash(xhtml)}" />

        {if is_set($responsive)}</noscript></div>{/if}
        {if $href}</a>{/if}
    {/if}

    {if $css_class_wrapper}
        </div>
    {/if}

    {switch match=$alignment}
    {case match='left'}
        </div>
    {/case}
    {case match='right'}
        </div>
    {/case}
    {case/}
    {/switch}

    {undef $image}

{/if}

{undef $image_content}

{/default}
