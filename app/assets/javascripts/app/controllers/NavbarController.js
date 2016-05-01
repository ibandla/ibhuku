ibhuku.controller('NavbarController', function($scope,$auth,$location) {

	 $scope.$watch(function() { return $location.path(); }, function(newVal, oldVal) {
      
       if(newVal=='/home')
		{
			$scope.header = 'header';
			$scope.banner = true;
		}else{
			$scope.header = 'header-product';
			$scope.banner = false;
		};
    });	
		
	$scope.logout = function () {
		$auth.signOut();
	}
	
});
