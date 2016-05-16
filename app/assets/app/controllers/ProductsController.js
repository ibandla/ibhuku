 app.controller('ProductsCtrl', function($scope,Ebook,ngCart) {

  	$scope.ebooks = Ebook.all();

    $scope.searchParams ;

    $scope.availableSearchParams = [
          { key: "title", name: "Title", placeholder: "Title..." },
          { key: "ISBN", name: "ISBN", placeholder: "ISBN..." },
          { key: "author", name: "Author", placeholder: "Author..." },
          { key: "description", name: "Description", placeholder: "Description..." }
        ];

    $scope.priceInfo = {
      min: 0,
      max: 1500
    }



});
