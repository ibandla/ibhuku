 ibhuku.controller('AuthController', function($scope,banner,$auth,$state,Notification) {

    banner.deactivate();
  
   
    $scope.handleRegBtnClick = function() {
      $auth.submitRegistration($scope.registrationForm)
        .then(function(resp) {
           $state.go('login');
        })
        .catch(function(resp) {
        $scope.test = "No";
        });
    };

    $scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm)
        .then(function(resp) {
          $state.go('home');
        })
        .catch(function(resp) {
          // handle error response
        });
    };


    $scope.handleSignOutBtnClick = function() {
      $auth.signOut()
        .then(function(resp) {
          // handle success response
        })
        .catch(function(resp) {
          // handle error response
        });
    };


});

