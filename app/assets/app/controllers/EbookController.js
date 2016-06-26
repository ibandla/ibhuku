app.controller('EbookCtrl', function($scope,Genre,$stateParams,Ebook,$sce) {	
	
    $scope.$sce = $sce;
   $scope.ebook = Ebook.one($stateParams["ebookID"]);
   $scope.number = 5;
      $scope.getNumber = function(num) {
          return new Array(num);   
      }

      
   
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

