app.controller ('HomeCtrl', function($scope,Ebook) {

    $scope.ebooks =  Ebook.random();
     $scope.downloadPdf = function() {
      Ebook.downloadPdf();
  };

});
