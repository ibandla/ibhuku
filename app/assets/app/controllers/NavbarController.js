app.controller('NavbarCtrl', function($rootScope,$scope,$auth,Ebook,$location,$window,ngCart) {

  $scope.openPdf =  function() {
      Ebook.openPdf();
  };

  $scope.downloadPdf = function() {
      Ebook.downloadPdf();
  };

  	$scope.myVar = 'open';

    $scope.$watch(function() { return ngCart.getTotalItems(); }, function(newVal, oldVal) {
		       var it = "";
		  if(ngCart.getTotalItems() == 1){
		      it = "item";
		  }
		  else{
		    it = "items";
		  }
       $rootScope.summary =  'KES '+(ngCart.totalCost())+', '+(ngCart.getTotalItems()) + ' ' + it;

    });

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
