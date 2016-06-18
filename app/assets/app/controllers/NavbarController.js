app.controller('NavbarCtrl', function($rootScope,$scope,$auth,$location,$window,ngCart) {
    var it = "";
  if(ngCart.getTotalItems() == 1){
      it = "item";
  }
  else{
    it = "items";
  }
  

    $scope.summary =  'KES '+(ngCart.totalCost())+', '+(ngCart.getTotalItems()) + ' ' + it;
    $rootScope.ebooks = {};

    $rootScope.searchParams = {
      "query":""
    };

     $scope.searchbar = false;
        $scope.toggleCustom = function() {
        	if($scope.searchbar)
        		$scope.searchbar = false;
        	else
        		$scope.searchbar = true;
        };

    $rootScope.availableSearchParams = [
          { key: "title", name: "Title", placeholder: "Title..." },
          { key: "ISBN", name: "ISBN", placeholder: "ISBN..." },
          { key: "author", name: "Author", placeholder: "Author..." },
          { key: "description", name: "Description", placeholder: "Description..." }
        ]; 
	 $scope.$watch(function() { return $location.path(); }, function(newVal, oldVal) {
      
       if(newVal=='/home')
		{
			$scope.header = 'header';
			$scope.showbanner = true;
		}else{
			$scope.header = 'header-product';
			$scope.showbanner = false;
		};
    });	
		
	$scope.logout = function () {
		$auth.signOut();
	}
	 
});
