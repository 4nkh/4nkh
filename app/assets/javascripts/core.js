/*JS TINK

/* Global Page Load Event Handler */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function globalPageLoad() {
	hideIPhoneLocationBar();
	setMobileMenuButton();
	
	activateMenuItem("current", "mn_");
	document.documentElement.getElementsByTagName("body")[0].className = "loaded " + document.documentElement.getElementsByTagName("body")[0].className;
	
	//pageResize(false);
}

addEvt(window, "load", globalPageLoad);
//addEvt(window, "resize", pageResize);



/* Creates Website's Necessary HTML5 Tags */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function createHTML5Tags() {
	var aElements = ["article", "aside", "footer", "header", "nav", "section"];
	for (var i = 0; i < aElements.length; i++)
		document.createElement(aElements[i]);
}




/* Tries to activate a menu item based on BODY tag classes */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function activateMenuItem(currentClass, prefix) {
	var bodyClasses = document.documentElement.getElementsByTagName("body")[0].className.split(" ");
	for (var i = 0; i < bodyClasses.length; i++ ) {
		if ( document.getElementById(prefix + bodyClasses[i]) )
			document.getElementById(prefix + bodyClasses[i]).className = currentClass + " " + document.getElementById(prefix + bodyClasses[i]).className;
	}
}



/* Hides iPhone's Location Bar */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function hideIPhoneLocationBar() {
	if ( (screen.availWidth < 748) && (!window.location.hash) )
		setTimeout(function() { window.scrollTo(0,1); }, 0);
}




/* Sets behavior for the mobile menu button */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function setMobileMenuButton() {
	if ( screen.availWidth < 748) {
		var menuButton = document.getElementById("mobileMenuButton");
		menuButton.nav = document.getElementsByTagName("header")[0].getElementsByTagName("nav")[0];
		
		menuButton.onclick = function() {
				if (!(/doHide\s/).test(this.className)) {
					this.className = "doHide " + this.className;
					this.nav.style.height = String(this.nav.getElementsByTagName("ul")[0].offsetHeight) + "px"
				} else {
					this.className = this.className.replace(/doHide\s/g, "");
					this.nav.style.height = "0"
				}
			};
	}
}




/* Page Resize Event Handler */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function pageResize() {
	if ( !window.pageWidth )
		window.pageWidth = { current: null, widths: [768,1024,1280,1600] };
	
	var setAsCurrent = window.pageWidth.widths[0];
	for ( var i = window.pageWidth.widths.length - 1; i >= 0; i-- ) {
		var windowWidth = window.innerWidth;
		if ( window.innerWidth >= window.pageWidth.widths[i] ) {
			setAsCurrent = window.pageWidth.widths[i];
			i = -1;
		}
	}
	
	
	if (setAsCurrent != window.pageWidth.current) {
		window.pageWidth.current = setAsCurrent;
		
		var body = document.documentElement.getElementsByTagName("body")[0];
		document.documentElement.getElementsByTagName("body")[0].className = document.documentElement.getElementsByTagName("body")[0].className.replace(/^w[0-9](.*?)\s/gi, "");
		document.documentElement.getElementsByTagName("body")[0].className = "w" + String(window.pageWidth.current) + " " + document.documentElement.getElementsByTagName("body")[0].className;
	}
}




/* Creates UI-Squares Apparition Transition Delay */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function createTransitionDelay(ULElement, delayIncrement) {
	if ( screen.availWidth < 748 )
		return; // Dosent add transition delays on mobile
	
	if (delayIncrement == null)
		delayIncrement = .05;
		
	var delay = 0;
	var delayString = "";
	var li;
	
	for ( var cNodes = 0; cNodes < ULElement.childNodes.length; cNodes++ ) {
		li = ULElement.childNodes[cNodes];
		if ( li.nodeName.toLowerCase() == "li" ) {
			/*
			li.style.webkitTransitionDelay = String(delay) + "s";
			li.style.mozTransitionDelay = String(delay) + "s";
			li.style.msTransitionDelay = String(delay) + "s";
			li.style.oTransitionDelay = String(delay) + "s";
			li.style.transitionDelay = String(delay) + "s";
			*/
			delayString = li.attributes.getNamedItem("style") ? li.attributes.getNamedItem("style").value + " " : "";
			delayString += "-webkit-transition-delay:" + delay + "s; ";
			delayString += "-moz-transition-delay:" + delay + "s; ";
			delayString += "-ms-transition-delay:" + delay + "s; ";
			delayString += "-o-transition-delay:" + delay + "s; ";
			delayString += "transition-delay:" + delay + "s;";
			
			li.setAttribute("style", delayString);
			
			delay += .05;
		}
	}
}




/* Creates Links on Wrapper of Portfolio Piece */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function createPiecesLinks(ULElement) {
	var aLI = ULElement.getElementsByTagName("li");
	for ( var cLI = 0; cLI < aLI.length; cLI++ ) {
		var li = aLI[cLI];
		var classes = "|" + li.className.replace(/\s/g, "|") + "|";
		var supportsTouch = (typeof Touch == "object");
		
		if ( classes.indexOf("|piece|") != -1 ) {
			if (li.getElementsByTagName("a").length > 0) {
				li.style.cursor = "pointer";
				li.onclick = function () { window.location.href = this.getElementsByTagName("a")[0].href; return false; };
			}
		} else if (classes.indexOf("|social|") != -1) {
			li.onclick = function() {
					var socialMediaElement = document.getElementById("socialMedia");
					if ( !(/shown\s/).test(socialMediaElement.className) ) {
						socialMediaElement.className = socialMediaElement.className.replace(/hidden\s/gi, "");
						socialMediaElement.className = "shown " + socialMediaElement.className;
					} else
						socialMediaElement.className = socialMediaElement.className.replace(/shown\s/gi, "hidden ");
					return false;
				};
			if ( document.getElementById("closeSocialMediaButton") )
				document.getElementById("closeSocialMediaButton").onclick = function () {
						var socialMediaElement = document.getElementById("socialMedia");
						if ( !(/shown\s/).test(socialMediaElement.className) ) {
							socialMediaElement.className = socialMediaElement.className.replace(/hidden\s/gi, "");
							socialMediaElement.className = "shown " + socialMediaElement.className;
						} else
							socialMediaElement.className = socialMediaElement.className.replace(/shown\s/gi, "hidden ");	
					}
		} else {
			if (supportsTouch)
				li.onclick = function() {};
		}
	}
}




/* Sets a section sub-navs */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function setSectionSubNavs() {
	var pageNavs = document.getElementsByTagName("section")[0].getElementsByTagName("nav");
	for ( var cNavs = 0; cNavs < pageNavs.length; cNavs++ ) {
		var navAnchors = pageNavs[cNavs].getElementsByTagName("a");
		for ( var cAnchors = 0; cAnchors < navAnchors.length; cAnchors++ )
			navAnchors[cAnchors].onclick = function () {
					scrollToElement( document.getElementById(this.href.substring(this.href.lastIndexOf("#") + 1)) );
					return false;
				};
	}
}




/* Scrolls Page to Requested Element */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function scrollToElement(requestedElement) {
	if ( requestedElement ) {
		var element = requestedElement;
		var yPos = 0;
		
		if (element.offsetParent) {
			while(1) {
				yPos += element.offsetTop;
				if(!element.offsetParent)
					break;
				element = element.offsetParent;
			}
		} else if (element.y)
			yPos += element.y;
		
		if (!window.elementInterval)
			window.elementInterval = new Object();
		
		var currentScrollTop = document.body.scrollTop;
		if (currentScrollTop == 0 && document.documentElement.scrollTop)
			currentScrollTop = document.documentElement.scrollTop;
		
		
		window.elementInterval.speed = yPos >= currentScrollTop ? 80 : -80;
		window.elementInterval.finalYPos = yPos;
		window.elementInterval.previousPos = null;
		
		window.elementInterval.interval = setInterval( function() {
				var currentScrollTop = document.body.scrollTop;
				if (currentScrollTop == 0 && document.documentElement.scrollTop)
					currentScrollTop = document.documentElement.scrollTop;
					
				if ( window.elementInterval.previousPos != currentScrollTop ) {
					window.elementInterval.previousPos = currentScrollTop;
					
					if ( window.elementInterval.speed > 0 ) {
						if ( (currentScrollTop + window.elementInterval.speed < window.elementInterval.finalYPos) ) {
							window.scrollBy(0,window.elementInterval.speed);
						} else {
							window.scrollTo(0,window.elementInterval.finalYPos);
							clearInterval(window.elementInterval.interval)
							window.elementInterval.speed = null;
							window.elementInterval.interval = null;
							window.elementInterval.previousPos = null;
							window.elementInterval = null;
						}
					} else if ( window.elementInterval.speed < 0 ) {
						if ( (currentScrollTop - window.elementInterval.speed > window.elementInterval.finalYPos) ) {
							window.scrollBy(0,window.elementInterval.speed);
						} else {
							window.scrollTo(0,window.elementInterval.finalYPos);
							clearInterval(window.elementInterval.interval)
							window.elementInterval.speed = null;
							window.elementInterval.interval = null;
							window.elementInterval.previousPos = null;
							window.elementInterval = null;
						}
					}
				} else {
					window.scrollTo(0,window.elementInterval.finalYPos);
					clearInterval(window.elementInterval.interval)
					window.elementInterval.speed = null;
					window.elementInterval.interval = null;
					window.elementInterval.previousPos = null;
					window.elementInterval = null;
				}
			}, 1);
	}
}




/* Universal addEventListener */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
function addEvt(obj, evt, func, capture) {
	if ( typeof(obj) == "object" ) {
		if ( capture != true ) capture = false;
		if (obj != null) {
		  if ( obj.addEventListener )
			  obj.addEventListener(evt, func, capture);
		  else if ( obj.attachEvent )
			  obj.attachEvent("on" + evt, func);
		}	
	}
}
