
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function P7_autoLayers() { //v1.4 by PVII
 var g,b,k,f,args=P7_autoLayers.arguments;a=parseInt(args[0]);if(isNaN(a))a=0;
 if(!document.p7setc){p7c=new Array();document.p7setc=true;for(var u=0;u<10;u++){
 p7c[u]=new Array();}}for(k=0;k<p7c[a].length;k++){if((g=MM_findObj(p7c[a][k]))!=null){
 b=(document.layers)?g:g.style;b.visibility="hidden";}}for(k=1;k<args.length;k++){
 if((g=MM_findObj(args[k]))!=null){b=(document.layers)?g:g.style;b.visibility="visible";f=false;
 for(var j=0;j<p7c[a].length;j++){if(args[k]==p7c[a][j]) {f=true;}}
 if(!f){p7c[a][p7c[a].length++]=args[k];}}}
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}


/*
$(document).ready(function(){
$('.creators').hide();
$('#creators').click(function(){
$(this).siblings('.creators').slideToggle();
});
});*/




$(document).ready(function(){
$('.services').hide();
$('#services').click(function(){
$('.seo').hide();
$('.hosting').hide();
$('.website').hide();
$('.portfolio').hide();
$('.business').hide();
$(this).siblings('.services').slideToggle("slow");
$('.services').mouseleave(function(){
$('.services').hide();
});
});

$('.seo').hide();
$('#seo').click(function(){
$('.hosting').hide();
$('.website').hide();
$('.portfolio').hide();
$('.business').hide();
$(this).siblings('.seo').slideToggle("slow");
$('.seo').mouseleave(function(){
$('.seo').hide();
});
});

$('.hosting').hide();
$('#hosting').click(function(){
$('.seo').hide();
$('.website').hide();
$('.portfolio').hide();
$('.business').hide();
$(this).siblings('.hosting').slideToggle("slow");
$('.hosting').mouseleave(function(){
$('.hosting').hide();
});
});

$('.website').hide();
$('#website').click(function(){
$('.seo').hide();
$('.hosting').hide();
$('.portfolio').hide();
$('.business').hide();
$(this).siblings('.website').slideToggle("slow");
$('.website').mouseleave(function(){
$('.website').hide();
});
});

$('.portfolio').hide();
$('#portfolio').click(function(){
$('.seo').hide();
$('.hosting').hide();
$('.website').hide();
$('.business').hide();
$(this).siblings('.portfolio').slideToggle("slow");
$('.portfolio').mouseleave(function(){
$('.portfolio').hide();
});
});
$('.business').hide();
$('#business').click(function(){
$('.seo').hide();
$('.hosting').hide();
$('.website').hide();
$('.portfolio').hide();
$(this).siblings('.business').slideToggle();
$('.business').mouseleave(function(){
$('.business').hide();
});
});
});


