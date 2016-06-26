app.controller ('HomeCtrl', function($scope,Ebook,$http,$auth,$rootScope,Restangular) {

    $scope.downloadPdf = function() {
        Ebook.downloadPdf();
    };
    $scope.openPdf =  function() {
        Ebook.openPdf();
    };

});
