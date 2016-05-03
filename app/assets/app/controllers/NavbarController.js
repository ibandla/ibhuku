app.controller('NavbarCtrl', function($rootScope,$scope,Auth,$location,$window) {

	 $scope.signedIn = Auth.isAuthenticated;
  	 $scope.logout = Auth.logout;
  	  Auth.currentUser().then(function (user){
    $scope.user = user;
  });

  	  $scope.$on('devise:new-registration', function (e, user){
    $scope.user = user;
  });

  $scope.$on('devise:login', function (e, user){
    $scope.user = user;
  });

  $scope.$on('devise:logout', function (e, user){
    $scope.user = {};
  });
  
	 $scope.$watch(function() { return $location.path(); }, function(newVal, oldVal) {
      
       if(newVal=='/home')
		{
			$scope.header = 'header';
			$scope.showbanner = true;
			$scope.pad = '0px';
			$(window).resize(function(){
           $(document.body).css('padding-top', '0px');
        });
			$(document.body).css('padding-top', '0px');
		}else{
			$scope.header = 'header-product';
			$scope.showbanner = false;
			$scope.pad = true;
			$(document.body).css('padding-top', $('#topnavbar').height() + 10);
			$(window).resize(function(){
            $(document.body).css('padding-top', $('#topnavbar').height() + 10);
        });
		};
    });	
		
	
	 
});
