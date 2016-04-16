angular
  .module('ibhuku')
  .factory('banner', function() {
   
    function activate() {
     var myEl = angular.element( document.querySelector( '#mainheader' ) );	
     myEl.removeClass('header-product');	
     myEl.addClass('header');
     var myEl2 = angular.element( document.querySelector( '#thebanner' ) );
      myEl2.removeAttr('hidden');
    }
    function deactivate() {
     var myEl = angular.element( document.querySelector( '#mainheader' ) );
		myEl.removeClass('header');
		myEl.addClass('header-product');
		var myEl2 = angular.element( document.querySelector( '#thebanner' ) );
		myEl2.attr('hidden', '');
    }    

    // We need to return the methods that we want
    //  to be accessible from outside the service
    return {
      activate: activate,
      deactivate: deactivate
    }

  });