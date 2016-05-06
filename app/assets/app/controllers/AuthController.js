 app.controller('AuthCtrl', function($scope,$auth) {


    $scope.handleRegBtnClick = function() {
      $auth.submitRegistration($scope.registrationForm);
    };

    $scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm);
    };

    $scope.handlePwdResetBtnClick = function() {
      $auth.requestPasswordReset($scope.pwdResetForm);      
    };

    $scope.handleUpdatePasswordBtnClick = function() {
      $auth.updatePassword($scope.updatePasswordForm);
    };
});
