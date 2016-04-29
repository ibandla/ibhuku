 ibhuku.controller('AuthController', function($scope,banner,$auth,$state,Notification) {

    banner.deactivate();

    $scope.handleRegBtnClick = function() {
      $auth.submitRegistration($scope.registrationForm);
    };

    $scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm);
    };

    $scope.handlePwdResetBtnClick = function() {
      $auth.requestPasswordReset($scope.pwdResetForm)
        .then(function(resp) {
          // handle success response
        })
        .catch(function(resp) {
          // handle error response
        });
    };

    $scope.handleUpdatePasswordBtnClick = function() {
      $auth.updatePassword($scope.updatePasswordForm)
        .then(function(resp) {
          // handle success response
        })
        .catch(function(resp) {
          // handle error response
        });
    };


   


});
