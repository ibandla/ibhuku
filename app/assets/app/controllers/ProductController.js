app.controller('ProductCtrl', function($scope,ngCart) {

	$scope.checkcart = function(id) {
 		if(ngCart.getItemById(id)==false)
 			return "block";
 		else 
 			return "none";
  };
 	
     $scope.currencySymbol = 'KES';
     $scope.blah = 'haha';
	$scope.image = ['<%= path_to_asset("f1.jpg") %>','B'];

   $scope.hello = "Hello World!";


});
