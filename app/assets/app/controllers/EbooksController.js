
 app.controller('EbooksCtrl', function($scope,Genre,$log,Ebook,ngCart,GenreBook,$rootScope) {


  $scope.currentPage = 1;
  $scope.pageSize = 9;
  $scope.genres = Genre.all();
  $scope.genreparam = 0;
  $scope.unsetSelected = function(){
     $scope.selectedgenre = {};
       $scope.genreparam = 0;
  };

  $scope.setSelected = function(genre){
      $log.debug(genre);

       $scope.selectedgenre = genre;
       $scope.genreparam = genre.id;

  };

  $scope.ebooks = Ebook.all();
  $scope.searchParams = {
      "query":""
    };


    $scope.availableSearchParams = [
          { key: "title", name: "Title", placeholder: "Title..." },
          { key: "ISBN", name: "ISBN", placeholder: "ISBN..." },
          { key: "author", name: "Author", placeholder: "Author..." },
          { key: "description", name: "Description", placeholder: "Description..." }
        ];

  $scope.pageChangeHandler = function(num) {
      console.log('drinks page changed to ' + num);
  };

  $scope.priceInfo = {
    min: 0,
    max: 1500
  }
    // $scope.searchParams = {
    //   "query":""
    // };


    // $scope.availableSearchParams = [
    //       { key: "title", name: "Title", placeholder: "Title..." },
    //       { key: "ISBN", name: "ISBN", placeholder: "ISBN..." },
    //       { key: "author", name: "Author", placeholder: "Author..." },
    //       { key: "description", name: "Description", placeholder: "Description..." }
    //     ];


    });
