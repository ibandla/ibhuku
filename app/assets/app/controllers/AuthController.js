 app.controller('AuthCtrl', function($scope,$state,Auth) {

     $scope.login = function() {
    Auth.login($scope.user).then(function(){
      $state.go('home');
    });
  };

  $scope.register = function() {
    Auth.register($scope.user).then(function(){
      $state.go('home');
    });
  };
    // $scope.handleRegBtnClick = function() {
    //   $auth.submitRegistration($scope.registrationForm);
    // };

    // $scope.handleLoginBtnClick = function() {
    //   $auth.submitLogin($scope.loginForm);
    // };

    // $scope.handlePwdResetBtnClick = function() {
    //   $auth.requestPasswordReset($scope.pwdResetForm);      
    // };

    // $scope.handleUpdatePasswordBtnClick = function() {
    //   $auth.updatePassword($scope.updatePasswordForm);
    // };
});
