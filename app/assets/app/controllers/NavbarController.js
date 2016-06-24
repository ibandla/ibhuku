app.controller('NavbarCtrl', function($rootScope,$scope,$auth,$location,$window,ngCart) {
    var it = "";
  if(ngCart.getTotalItems() == 1){
      it = "item";
  }
  else{
    it = "items";
  }
  

    $scope.summary =  'KES '+(ngCart.totalCost())+', '+(ngCart.getTotalItems()) + ' ' + it;
   
   
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
