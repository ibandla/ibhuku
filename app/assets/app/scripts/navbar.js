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

  
