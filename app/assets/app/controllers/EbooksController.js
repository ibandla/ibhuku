
 app.controller('EbooksCtrl', function($scope,Genre,Ebook,ngCart,$rootScope) {


    $scope.currentPage = 1;
  $scope.pageSize = 9;
  $scope.genres = Genre.all();
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


  	

    // $scope.searchParams = {
    //   "query":""
    // };


    // $scope.availableSearchParams = [
    //       { key: "title", name: "Title", placeholder: "Title..." },
    //       { key: "ISBN", name: "ISBN", placeholder: "ISBN..." },
    //       { key: "author", name: "Author", placeholder: "Author..." },
    //       { key: "description", name: "Description", placeholder: "Description..." }
    //     ];


    $scope.priceInfo = {
      min: 0,
      max: 1500
    }
    
});
