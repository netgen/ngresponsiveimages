/*! Picturefill - Responsive Images that work today. (and mimic the proposed Picture element with span elements). Author: Scott Jehl, Filament Group, 2012 | License: MIT/GPLv2 */

function isIE() {
  var myNav = navigator.userAgent.toLowerCase();
  return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
}

(function( w ){

	// Enable strict mode
	"use strict";

	var pictureFillImageProcessed = false;

	w.picturefill = function() {
		var ps = $('span[data-picture]');
		// var ps = w.document.getElementsByTagName( "span" );

		if (isIE() && isIE() <= 9) {
	 		// IE8 workaround
	 		if( pictureFillImageProcessed ){
	 			return false;
	 		}
	 		for( var i = 0, il = ps.length; i < il; i++ ){
	 			var picImg = w.document.createElement( "img" );
	 			picImg.src =  ps[ i ].getElementsByTagName( "span" )[0].getAttribute( "data-src" );
	 			ps[ i ].appendChild( picImg );
	 		}
	 		pictureFillImageProcessed = true;
	 		return false;
		}

		// Loop the pictures
		for( var i = 0, il = ps.length; i < il; i++ ){
			var sources = ps[ i ].getElementsByTagName( "span" ),
				matches = [];

			// See if which sources match
			for( var j = 0, jl = sources.length; j < jl; j++ ){
				var timerStart1 = Date.now();
				var media = sources[ j ].getAttribute( "data-media" );
				// if there's no media specified, OR w.matchMedia is supported

				if( !media || ( w.matchMedia && w.matchMedia( media ).matches ) ){
					matches.push( sources[ j ] );
				}
			}

			// Find any existing img element in the picture element
			var picImg = ps[ i ].getElementsByTagName( "img" )[ 0 ];


			if( matches.length ){
				var matchedEl = matches.pop();
				if( !picImg || picImg.parentNode.nodeName === "NOSCRIPT" ){
					picImg = w.document.createElement( "img" );
					picImg.alt = ps[ i ].getAttribute( "data-alt" );
				}

				picImg.src =  matchedEl.getAttribute( "data-src" );
				matchedEl.appendChild( picImg );
			}
			else if( picImg ){
				picImg.parentNode.removeChild( picImg );
			}
		}
	};

	// Run on resize and domready (w.load as a fallback)
	if( w.addEventListener ){
		w.addEventListener( "resize", w.picturefill, false );
		w.addEventListener( "DOMContentLoaded", function(){
			w.picturefill();
			// Run once only
			w.removeEventListener( "load", w.picturefill, false );
		}, false );
		w.addEventListener( "load", w.picturefill, false );
	}
	else if( w.attachEvent ){
		w.attachEvent( "onload", w.picturefill );
	}

}( this ));

