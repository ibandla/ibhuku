 app.controller('ProductsCtrl', function($scope,Ebook,ngCart) {

  	$scope.ebooks = Ebook.all();
    $scope.searchParams ;
    $scope.priceInfo = {
      min: 0,
      max: 1500
    }



});
