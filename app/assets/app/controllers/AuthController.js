 app.controller('AuthCtrl', function($scope, $auth,Authform,$location) {


     var reset = $location.search().reset_password_token;

     $scope.changePasswordForm = {};
     $scope.registrationForm = {};
     $scope.loginForm = {};
     $scope.passwordResetForm = {};
     
      if (reset) {
         $scope.changePasswordForm.reset_password_token = reset;
         $scope.changePasswordForm.fields = Authform.resetpass();
      } else {
        $scope.changePasswordForm.fields = Authform.updatepass();
      }
     
     $scope.loginForm.fields = Authform.login();
     $scope.registrationForm.fields = Authform.register();
     $scope.passwordResetForm.fields = Authform.reset();

     $scope.showsubmit = false;

     $scope.setResponse = function(response) {
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
