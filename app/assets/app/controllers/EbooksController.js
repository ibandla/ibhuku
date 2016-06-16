<<<<<<< Updated upstream
 app.controller('EbooksCtrl', function($rootScope,$scope,Ebook,ngCart) {
=======
 app.controller('EbooksCtrl', function($scope,Ebook,ngCart) {

  	$scope.ebooks;/* = Ebook.all();*/

    $scope.searchParams = {
      "query":""
    };


    $scope.availableSearchParams = [
          { key: "title", name: "Title", placeholder: "Title..." },
          { key: "ISBN", name: "ISBN", placeholder: "ISBN..." },
          { key: "author", name: "Author", placeholder: "Author..." },
          { key: "description", name: "Description", placeholder: "Description..." }
        ];

>>>>>>> Stashed changes
    $scope.priceInfo = {
      min: 0,
      max: 1500
    }
<<<<<<< Updated upstream
=======



>>>>>>> Stashed changes
});
