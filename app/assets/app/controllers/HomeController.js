 app.controller ('HomeCtrl', function($scope, $http,Cart) {
    	
    Cart.get(1).then(function (cart) {
         $scope.test = cart;
    });

    

});
