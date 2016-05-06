app.controller('NavbarCtrl', function($rootScope,$scope,$auth,$location,$window) {

	
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
		
	$scope.logout = function () {
		$auth.signOut();
	}
	 
});
