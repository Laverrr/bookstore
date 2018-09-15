// JavaScript Document
var ddmenuaim=function(documentobj,opts){

		var core_strundefined = typeof undefined;


        var ddextend=function(){
			var src, copyIsArray, copy, name, options, clone,
				target = arguments[0] || {},
				i = 1,
				length = arguments.length,
				deep = false;

			// Handle a deep copy situation
			if ( typeof target === "boolean" ) {
				deep = target;
				target = arguments[1] || {};
				// skip the boolean and the target
				i = 2;
			}

			// Handle case when target is a string or something (possible in deep copy)
			if ( typeof target !== "object" && !ddisFunction(target) ) {
				target = {};
			}

			// extend jQuery itself if only one argument is passed
			if ( length === i ) {
				target = this;
				--i;
			}

			for ( ; i < length; i++ ) {
				// Only deal with non-null/undefined values
				if ( (options = arguments[ i ]) != null ) {
					// Extend the base object
					for ( name in options ) {
						src = target[ name ];
						copy = options[ name ];

						// Prevent never-ending loop
						if ( target === copy ) {
							continue;
						}

						// Recurse if we're merging plain objects or arrays
						if ( deep && copy && ( ddisPlainObject(copy) || (copyIsArray = ddisArray(copy)) ) ) {
							if ( copyIsArray ) {
								copyIsArray = false;
								clone = src && ddisArray(src) ? src : [];

							} else {
								clone = src && ddisPlainObject(src) ? src : {};
							}

							// Never move original objects, clone them
							target[ name ] = ddextend( deep, clone, copy );

						// Don't bring in undefined values
						} else if ( copy !== undefined ) {
							target[ name ] = copy;
						}
					}
				}
			}

			// Return the modified object
			return target;
			}
		var ddisFunction= function( obj ) {
			return jQuery.type(obj) === "function";
		}

		ddisArray: Array.isArray || function( obj ) {
			return jQuery.type(obj) === "array";
		}

	var ddisPlainObject= function( obj ) {
		if ( !obj || ddtype(obj) !== "object" || obj.nodeType || ddisWindow( obj ) ) {
			return false;
		}

		try {
			if ( obj.constructor &&
				!core_hasOwn.call(obj, "constructor") &&
				!core_hasOwn.call(obj.constructor.prototype, "isPrototypeOf") ) {
				return false;
			}
		} catch ( e ) {
			return false;
		}


		var key;
		for ( key in obj ) {}

		return key === undefined || core_hasOwn.call( obj, key );
	}
	var ddtype= function( obj ) {
		if ( obj == null ) {
			return String( obj );
		}
		return typeof obj === "object" || typeof obj === "function" ?
			class2type[ core_toString.call(obj) ] || "object" :
			typeof obj;
	}
	var ddisWindow= function( obj ) {
		return obj != null && obj == obj.window;
	}


	        var $menu = documentobj,
            activeRow = null,
            mouseLocs = [],
            lastDelayLoc = null,
            timeoutId = null,
            options = ddextend({
                rowSelector: "> li",
                submenuSelector: "*",
                tolerance: 75,  // bigger = more forgivey when entering submenu
                enter: function() {},
                exit: function() {},
                activate: function() {},
                deactivate: function() {}
            }, opts);

        var MOUSE_LOCS_TRACKED = 3,
            DELAY = 300;

        var mousemoveDocument = function(e) {
            if(document.getElementById("__ddnav_sort")){
                if(document.getElementById("__ddnav_sort").style.display=="none") return;
            }
            var temp_val = 1;
            for(i=1;i<15;i++){
                if(sug_gid('__ddnav_sort'+i)){
                    if(sug_gid('__ddnav_sort'+i).style.display=="block"){
                        temp_val = 0;
                    }
                }
            }
            if(temp_val)return;
			e = e || window.event;
            var tar = e.toElement || e.srcElement || e.target;
            if(get_target(tar)==0){
                for(i=1;i<15;i++){
                    if(sug_gid('__ddnav_sort'+i)){
                        sug_gid('__ddnav_sort'+i).style.display="none";
                        sug_gid('li_label_'+i).className="n_b";
                    }
                }
            }
			if(e.pageX || e.pageY){
	            mouseLocs.push({x: e.pageX, y: e.pageY});
			}else{
				 mouseLocs.push({x:e.clientX + document.body.scrollLeft - document.body.clientLeft,
				y:e.clientY + document.body.scrollTop - document.body.clientTop});
			}
            if (mouseLocs.length > MOUSE_LOCS_TRACKED) {
                mouseLocs.shift();
            }
        };

        var mouseleaveMenu = function() {
                if (timeoutId) {
                    clearTimeout(timeoutId);
                    //options.exit(mouseLocs);
                }
            };

        var mouseenterRow = function(e) {
//				console.log(e.target.parentElement,this);
	var rowElement;
                e = e || window.event;
				if(e.target){
                    rowElement=getli(e.target);//e.target.parentElement;
                }else{
                    rowElement=getli(e.toElement);//e.toElement.parentElement;
                }
                if (timeoutId) {
                    clearTimeout(timeoutId);
                }
                //options.enter(this);
                possiblyActivate(rowElement);
            },
            mouseleaveRow = function(e) {
                //options.exit(this);
            };
        var getli = function(current_target){
            if(current_target.tagName.toLowerCase()=="li"){
                return current_target;
            }
            return getli(current_target.parentElement);
        };
        var get_target = function(current_target){
            if(current_target.tagName.toLowerCase()=="body" || current_target.tagName.toLowerCase()=="html"){
                return 0;
            }
            if(current_target.id=="menu_list"){
                return 1;
            }
            return get_target(current_target.parentElement);
        };
        var activate = function(row) {
                if (row == activeRow) {
                    //return;
                }

                if (activeRow) {
                    options.deactivate(activeRow);
                }

                options.activate(row);
                activeRow = row;
            };

        var possiblyActivate = function(row) {
                var delay = activationDelay();
                if (delay) {
                    timeoutId = setTimeout(function() {
                        possiblyActivate(row);
                    }, delay);
                } else {
                    activate(row);
                }
            };

       var activationDelay = function() {
                if (!activeRow) {
                    return 0;
                }

                var offset = ddoffset($menu);
                var upperRight = {
                        x: offset.left + $menu.offsetWidth,
                        y: offset.top - options.tolerance
                    },
                    lowerRight = {
                        x: offset.left + $menu.offsetWidth,
                        y: offset.top + $menu.offsetHeight + options.tolerance
                    },
                    loc = mouseLocs[mouseLocs.length - 1],
                    prevLoc = mouseLocs[0];

                if (!loc) {
                    return 0;
                }

                if (!prevLoc) {
                    prevLoc = loc;
                }

                if (prevLoc.x < offset.left || prevLoc.x > lowerRight.x ||
                    prevLoc.y < offset.top || prevLoc.y > lowerRight.y) {

                    return 0;
                }

                if (lastDelayLoc &&
                        loc.x == lastDelayLoc.x && loc.y == lastDelayLoc.y) {

                    return 0;
                }
                function slope(a, b) {
                    return (b.y - a.y) / (b.x - a.x);
                };

                var upperSlope = slope(loc, upperRight),
                    lowerSlope = slope(loc, lowerRight),
                    prevUpperSlope = slope(prevLoc, upperRight),
                    prevLowerSlope = slope(prevLoc, lowerRight);

                if (upperSlope < prevUpperSlope &&
                        lowerSlope > prevLowerSlope) {
                    lastDelayLoc = loc;
                    return DELAY;
                }

                lastDelayLoc = null;
                return 0;
            };
			//判断节点对象是否包含的函�?
		var contains=function (p,c){
			return p.contains ?
			p != c && p.contains(c) :
			!!(p.compareDocumentPosition(c) & 16);
		}
		var fixedMouse=function (e,target){
			var related,
			type=e.type.toLowerCase();//这里获取事件名字
			if(type=='mouseover'){
			related=e.relatedTarget||e.fromElement
			}else if(type='mouseout'){
			related=e.relatedTarget||e.toElement
			}else return true;
			return related && related.prefix!='xul' && !contains(target,related) && related!==target;
		}
		 var addListener=function (element,e,fn){
			  if(element.addEventListener){
				   element.addEventListener(e,fn,false);
			  } else {
				   element.attachEvent("on" + e,fn);
			  }
		 }
		 var getWindow=function ( elem ) {
				return ddisWindow( elem ) ?
					elem :
					elem.nodeType === 9 ?
						elem.defaultView || elem.parentWindow :
						false;
			}
		ddoffset = function( element ) {
			if ( arguments.length<1 ) {
				return { top: 0, left: 0 }
			}

			var docElem, win,
				box = { top: 0, left: 0 },
				elem = element,
				doc = elem && elem.ownerDocument;

			if ( !doc ) {
				return;
			}

			docElem = doc.documentElement;

			// Make sure it's not a disconnected DOM node
			if ( !contains( docElem, elem ) ) {
				return box;
			}

			// If we don't have gBCR, just use 0,0 rather than error
			// BlackBerry 5, iOS 3 (original iPhone)
			if ( typeof elem.getBoundingClientRect !== core_strundefined ) {
				box = elem.getBoundingClientRect();
			}
			win = getWindow( doc );
			return {
				top: box.top  + ( win.pageYOffset || docElem.scrollTop )  - ( docElem.clientTop  || 0 ),
				left: box.left + ( win.pageXOffset || docElem.scrollLeft ) - ( docElem.clientLeft || 0 )
			};
		};
        var init = function() {
			addListener($menu,"mouseout",mouseleaveMenu);
			$menuitem=$menu.getElementsByTagName("li");
			for(i=0;i<$menuitem.length;i++){
				addListener($menuitem[i],'mouseover',mouseenterRow);
				addListener($menuitem[i],'mouseout',mouseleaveRow);
				}
			document.onmousemove=mousemoveDocument;
        };

        init();
        return this;
	}