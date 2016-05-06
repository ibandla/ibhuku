 app.controller('ProductsCtrl', function($scope,Ebook) {

  	$scope.ebooks = Ebook.all();


});
