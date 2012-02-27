function getCookie(c_name)
{
if (document.cookie.length>0)
  {
  c_start=document.cookie.indexOf(c_name + "=");
  if (c_start!=-1)
    { 
    c_start=c_start + c_name.length+1 ;
    c_end=document.cookie.indexOf(";",c_start);
    if (c_end==-1) c_end=document.cookie.length
    return unescape(document.cookie.substring(c_start,c_end));
    } 
  }
return ""
}

function setCookie(c_name,value, expires, path, domain, secure) {
    document.cookie= c_name + "=" + escape(value) +
        ((expires) ? "; expires=" + expires.toGMTString() : "") +
        ((path) ? "; path=" + path : "") +
        ((domain) ? "; domain=" + domain : "") +
        ((secure) ? "; secure" : "");
}



function showhosting(thechosenone) {
      var onglets = document.getElementsByTagName("div");
            for(var x=0; x<onglets.length; x++) {
                  name = onglets[x].getAttribute("name");
                 

                  if (name == 'onglets') {
                        if (onglets[x].id == thechosenone) {
                        onglets[x].style.display = 'block';  
                        value=onglets[x].id;
                        setCookie('tab', value);
                                  
                  }
                  else {
                        onglets[x].style.display = 'none';
                     
                  }
            }
      }
}


function showseo(thechosenone) {
      var seo = document.getElementsByTagName("div");
            for(var x=0; x<seo.length; x++) {
                  name = seo[x].getAttribute("name");


                  if (name == 'seo') {
                        if (seo[x].id == thechosenone) {
                        seo[x].style.display = 'block';
                        value=seo[x].id;
                        setCookie('seo', value);

                  }
                  else {
                        seo[x].style.display = 'none';

                  }
            }
      }
}

function showbusi(thechosenone) {
      var busi = document.getElementsByTagName("div");
            for(var x=0; x<busi.length; x++) {
                  name = busi[x].getAttribute("name");


                  if (name == 'busi') {
                        if (busi[x].id == thechosenone) {
                        busi[x].style.display = 'block';
                        value=busi[x].id;
                        setCookie('busi', value);

                  }
                  else {
                        busi[x].style.display = 'none';

                  }
            }
      }
}




function tapeCookie(name,value, days, path) {
    if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/seo/";
        document.cookie = name+"="+value+expires+"; path=/fr/seo/";
        window.location="http://4nkh.com/seo/plan";
        }


function tapefrCookie(name,value, days, path) {
    if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/seo/";
        document.cookie = name+"="+value+expires+"; path=/fr/seo/";
        window.location="http://4nkh.com/fr/seo/plan";
        }

function recordCookie(name,value, days, path) {
    if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/hosting/";
        document.cookie = name+"="+value+expires+"; path=/fr/hosting/";
	window.location="http://4nkh.com/hosting/plan";
	}

function recordfrCookie(name,value, days, path) {
    if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/hosting/";
        document.cookie = name+"="+value+expires+"; path=/fr/hosting/";
        window.location="http://4nkh.com/fr/hosting/plan";
        }


function fillCookie(name,value, days, path) {
    if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/business/";
        document.cookie = name+"="+value+expires+"; path=/fr/business/";
        window.location="http://4nkh.com/business/plan";
        }

function fillfrCookie(name,value, days, path) {
    if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/business/";
        document.cookie = name+"="+value+expires+"; path=/frbusiness/";
        window.location="http://4nkh.com/fr/business/plan";
        }

