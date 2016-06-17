 $(window).scroll(collapseNavbar);
$(document).load(collapseNavbar);
   
  
 function collapseNavbar() {
    if ($(".navbar-fixed-top").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
}

   WebFontConfig = {
      google: {
      families: ['Roboto+Slab:300,700,400','Lato:100,300,400,700,900','Roboto+Slab:400,100,300,700','Material+Icons','Kaushan+Script']
    }
   };

   (function(d) {
      var wf = d.createElement('script'), s = d.scripts[0];
      wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js';
      s.parentNode.insertBefore(wf, s);
   })(document);