 app.controller('ProductsCtrl', function($scope,Ebook,ngCart) {

  	$scope.ebooks = Ebook.all();

    $scope.priceInfo = {
      min: 0,
      max: 1000000
    }

    $scope.checkcart = function(id) {
 		if(ngCart.getItemById(id)==false)
 			return "block";
 		else 
 			return "none";
  };
 	
     $scope.currencySymbol = 'KES';
     $scope.blah = 'haha';
	$scope.image = ['<%= path_to_asset("f1.jpg") %>','B'];


});
