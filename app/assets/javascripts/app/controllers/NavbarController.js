ibhuku.controller('NavbarController', function($scope,$state,$auth,Notification,$rootScope) {

	$scope.loggedin= $rootScope.signedIn;
	$scope.logout = function () {
		$auth.signOut();
	}
	// $scope.signedIn =if($auth.validateUser();
	  
 	//  $scope.signedIn = Auth.isAuthenticated;
  // $scope.logout = Auth.logout;

  // Auth.currentUser().then(function (user){
  //   $scope.user = user;
  // });


});
