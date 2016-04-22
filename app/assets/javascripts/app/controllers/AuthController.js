 ibhuku.controller('AuthController', function($scope,banner,$auth) {

    banner.deactivate();
  
    $scope.test = "w";
    $scope.handleRegBtnClick = function() {
      $auth.submitRegistration($scope.registrationForm)
        .then(function(resp) {
          alert("Yes");
        })
        .catch(function(resp) {
        $scope.test = "No";
        });
    };

    $scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm)
        .then(function(resp) {
          // handle success response
        })
        .catch(function(resp) {
          // handle error response
        });
    };



});
