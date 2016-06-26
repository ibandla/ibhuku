 app.controller ('HomeCtrl', function($scope,Ebook) {
 	$scope.ebooks = Ebook.random();
});
