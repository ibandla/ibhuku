 addEventListener("load", function()
 	{
	 setTimeout(hideURLbar, 0);
	 }, false);
	function hideURLbar(){
		window.scrollTo(0,1);
	}

 $(document).ready(function () {
     $('#horizontalTab').easyResponsiveTabs({
         type: 'horizontal', 
         width: 'auto', 
         fit: true   
     });
 });		