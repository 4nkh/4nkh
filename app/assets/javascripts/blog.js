function blogger(thechosenone) {
      var blog = document.getElementsByTagName("div");
	  console.log(blog)
            for(var x=0; x<blog.length; x++) {
                  name = blog[x].getAttribute("name");
                  
                  if (name == 'blog') {
                        if (blog[x].id == thechosenone) {
                        blog[x].style.display = 'block';                       
                                  
                                                    }
                  else {
                        blog[x].style.display = 'none';
                     
                  }
            }
      }
}

function navnews(thechosenone) {
      var news = document.getElementsByTagName("li");
            for(var x=0; x<news.length; x++) {
                  name = news[x].getAttribute("name");
                  
                  if (name == 'news') {
                        if (news[x].id == thechosenone) {
                        news[x].style.display = 'block';                        
                                                          
                  }
                  else {
                        news[x].style.display = 'none';
                     
                  }
            }
      }
}
function showonlyone(thechosenone) { 
	var post = document.getElementsByTagName("div"); 
	for(var x=0; x<post.length; x++) { 
		name = post[x].getAttribute("name"); 
	  if (name == 'post') { 
	  	if (post[x].id == thechosenone) { 
	  		post[x].style.display = 'block'; } 
	  	else { 
		  	post[x].style.display = 'none'; } 
	  } 
	} 
	if (thechosenone == "post1"){ 
		jQuery('#post_model').val('textos'); 
		jQuery('#url_blog_field').hide(); } 
		
	if (thechosenone == "post2"){ 
		jQuery('#url_blog_field').hide(); 
		jQuery('#post_model').val('images'); } 
		
	if (thechosenone == "post3"){ 
		jQuery('#url_blog_field').show(); 
		jQuery('#post_model').val('links'); 
		jQuery('.post_url_new').attr('placeholder', 'Paste your link'); } 
		
	if (thechosenone == "post4"){ 
		jQuery('#url_blog_field').show(); 
		jQuery('#post_model').val('videos'); 
		jQuery('.post_url_new').attr('placeholder', 'Paste your YOUTUBE of VIMEO url');}
}

/*function showonlyone(thechosenone) {
      var post = document.getElementsByTagName("div");
            for(var x=0; x<post.length; x++) {
                  name = post[x].getAttribute("name");
                 

                  if (name == 'post') {
                        if (post[x].id == thechosenone) {
                        post[x].style.display = 'block';  
                                                          
                  }
                  else {
                        post[x].style.display = 'none';
                     
                  }
            }
      }
}*/
jQuery(document).ready(function(){
jQuery('#password').hide();
jQuery('#slidePass').click(function(){
jQuery(this).siblings('#password').slideToggle();
});
});

$(document).ready(function(){
$('.gliss').hide();
$('#slideBlog').click(function(){
$(this).siblings('.gliss').slideToggle();
});
});

$(document).ready(function(){
$('.mover').show();
$('#slideToggle').click(function(){
$(this).siblings('.mover').slideToggle();
});
});
