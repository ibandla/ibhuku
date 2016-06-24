app.controller('EbookCtrl', function($scope,Genre,$stateParams,Ebook) {	
	

   $scope.ebook = Ebook.one($stateParams["ebookID"]);
   
    $scope.data = {
      selectedIndex: 0,
      bottom:        false
    };
    $scope.next = function() {
      $scope.data.selectedIndex = Math.min($scope.data.selectedIndex + 1) ;
    };
    $scope.previous = function() {
      $scope.data.selectedIndex = Math.max($scope.data.selectedIndex - 1, 0);
    };
 

});

