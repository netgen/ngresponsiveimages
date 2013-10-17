{* ngresponsiveimages image *}

{*
Input:
 image_class - Which image alias to show, default is large
 css_class     - Optional css class to wrap around the <img> tag, the
                 class will be placed in a <div> tag.
 css_image_class - Optional css class to apply to <img> tag.
 alignment     - How to align the image, use 'left', 'right' or false().
 link_to_image - boolean, if true the url_alias will be fetched and
                 used as link.
 href          - Optional string, if set it will create a <a> tag
                 around the image with href as the link.
 border_size   - Size of border around image, default is 0
*}
{default image_class=large
         css_class=false()
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
         css_image_class=false()}

{let image_content = $attribute.content}

{if and( ezini_hasvariable( 'Responsive', 'AlwaysResponsive', 'ngresponsiveimages.ini' ), ezini( 'Responsive', 'AlwaysResponsive', 'ngresponsiveimages.ini' )|eq('enabled'), is_set( $responsive_image_class )|not )}
    {def $responsive_image_class = $image_class}
{/if}

{if $image_content.is_valid}
    {if and(is_set( $responsive_image_class ), $responsive_image_class|count, ezini_hasvariable( $responsive_image_class, 'DefaultMap', 'ngresponsiveimages.ini' ), is_set($responsive_disabled)|not )}
        {def $mq_expressions = array()}
        {if ezini_hasvariable( 'Responsive', 'MediaQueryExpressions', 'ngresponsiveimages.ini' )}
            {set $mq_expressions = ezini( 'Responsive', 'MediaQueryExpressions', 'ngresponsiveimages.ini' )}
        {/if}

        {def $mq_mappings = ezini( $responsive_image_class, 'MediaQueryMappings', 'ngresponsiveimages.ini' )}
        {ezscript_require( array( 'matchmedia.js', 'picturefill.js' ) )}
        {set-block variable = $responsive_images}
            <span data-src={$image_content[ezini( $responsive_image_class, 'DefaultMap', 'ngresponsiveimages.ini' )].url|ezroot}></span>
            {foreach $mq_mappings as $screen => $mq_map_alias}
                {if and( is_set( $mq_expressions[$screen] ), $mq_expressions[$screen]|count )}
                    <span data-src={$image_content[$mq_map_alias].url|ezroot} data-media="{$mq_expressions[$screen]|wash}"></span>
                {/if}
            {/foreach}
        {/set-block}
        {* add undef *}
    {/if}

    {let image        = $image_content[$image_class]
         inline_style = ''}

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

    {if and( $css_class, $css_class|count )}
        <div class="{$css_class|wash}">
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
        {if $href}<a href={$href}{if and( is_set( $link_class ), $link_class )} class="{$link_class}"{/if}{if and( is_set( $link_id ), $link_id )} id="{$link_id}"{/if}{if $target} target="{$target}"{/if}{if and( is_set( $link_title ), $link_title )} title="{$link_title|wash}"{/if}>{/if}

        {if and( is_set( $responsive_image_class ), ezini_hasvariable( $responsive_image_class, 'DefaultMap', 'ngresponsiveimages.ini' ), is_set( $responsive_disabled )|not )}<span data-picture data-alt="{$alt_text|wash(xhtml)}">{$responsive_images}<noscript>{/if}

        <img src={$image.url|ezroot}{if $css_image_class} class="{$css_image_class}"{/if}{if $hspace} hspace="{$hspace}"{/if} style="{$inline_style}" alt="{$alt_text|wash(xhtml)}" title="{$title|wash(xhtml)}" />

        {if and( is_set( $responsive_image_class ), ezini_hasvariable( $responsive_image_class, 'DefaultMap', 'ngresponsiveimages.ini' ), is_set( $responsive_disabled )|not )}</noscript></span>{/if}

        {if $href}</a>{/if}
    {/if}

    {if and( $css_class, $css_class|count )}
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

    {/let}

{/if}

{/let}

{/default}
