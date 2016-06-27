app.controller ('HomeCtrl', function($scope,Ebook,$http,$auth,$rootScope,Restangular) {

    $scope.ebooks =  Ebook.random();
    
});
