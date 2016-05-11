 app.controller('ProductsCtrl', function($scope,Ebooks) {

  	$scope.ebooks = Ebook.all();

    $scope.priceInfo = {
      min: 0,
      max: 1000000
    }


});
