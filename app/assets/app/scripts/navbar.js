 $(window).scroll(collapseNavbar);
$(document).load(collapseNavbar);
 $('.search').hide();
 $('button').click(function ()
 	{
 		$('.search').show();
 		$('.text').focus();
 	});
 $('.close-in').click(function()
 	{
 		$('.search').hide();
 	});

  $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

  $(".sidebar-nav").click(function(e) {
       
        $("#wrapper").toggleClass("toggled");
    });

  
 function collapseNavbar() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
}




  $(function() { 

    $('a[href="#toggle-search"], .navbar-bootsnipp .bootsnipp-search .input-group-btn > .btn[type="reset"]').on('click', function(event) {
        event.preventDefault();
        // $('.navbar-bootsnipp .bootsnipp-search .input-group > input').val('');
        $('.navbar-bootsnipp .bootsnipp-search').toggleClass('open');
        $('a[href="#toggle-search"]').closest('li').toggleClass('active');

        if ($('.navbar-bootsnipp .bootsnipp-search').hasClass('open')) {
            /* I think .focus dosen't like css animations, set timeout to make sure input gets focus */
            setTimeout(function() { 
                $('.navbar-bootsnipp .bootsnipp-search .form-control').focus();
            }, 100);
        }           
    });

    $(document).on('keyup', function(event) {
        if (event.which == 27 && $('.navbar-bootsnipp .bootsnipp-search').hasClass('open')) {
            $('a[href="#toggle-search"]').trigger('click');
        }
    });
    
});


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