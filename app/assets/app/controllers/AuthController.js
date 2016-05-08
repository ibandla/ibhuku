 app.controller('AuthCtrl', function($scope,$auth,Title) {

    $scope.titles = Title.all();
    $scope.showsubmit = false;

     $scope.setResponse = function (response) {
        $scope.showsubmit = true;
    };

     $scope.cbExpiration = function() {
        $scope.showsubmit = false;
    };
   
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
