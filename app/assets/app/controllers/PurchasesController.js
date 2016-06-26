 app.controller('PurchasesCtrl', function($scope,Ebook) {

  $scope.currentPage = 1;
  $scope.pageSize = 9;
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


   

});
