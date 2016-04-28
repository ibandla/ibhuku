 ibhuku.controller('AuthController', function($scope,banner,$auth,$state,Notification) {

    banner.deactivate();
  
   
    $scope.handleRegBtnClick = function() {
      $auth.submitRegistration($scope.registrationForm);
    };

    $scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm);
    };


   


});

