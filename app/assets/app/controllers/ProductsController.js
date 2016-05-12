 app.controller('ProductsCtrl', function($scope,Ebook,ngCart) {

  	$scope.ebooks = Ebook.all();
    $scope.test = 'Blaf';
    $scope.priceInfo = {
      min: 0,
      max: 1500
    }

    $scope.checkcart = function(id) {
 		if(ngCart.getItemById(id)==false)
 			return "false";
 		else 
 			return "true";
  };
 	
     $scope.currencySymbol = 'KES';
     $scope.blah = 'haha';
	$scope.image = ['<%= path_to_asset("f1.jpg") %>','B'];


});
