app.controller('ProductCtrl', function($scope,$stateParams,Ebook) {	
	

   $scope.ebook = Ebook.one($stateParams["ebookID"]);


});
