app.controller('EbookCtrl', function($scope,$stateParams,Ebook) {	
	

   $scope.ebook = Ebook.one($stateParams["ebookID"]);


});
