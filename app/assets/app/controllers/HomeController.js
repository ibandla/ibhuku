 app.controller ('HomeCtrl', function($scope, $http,Cart) {
    	
    test = Cart.$find(2);
    $scope.test = test.$fetch();


});
