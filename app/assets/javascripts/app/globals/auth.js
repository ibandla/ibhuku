ibhuku.run(function($rootScope, $location,Notification) {
    $rootScope.$on('auth:login-success', function(ev, user) {
    $location.path('/home');
    $rootScope.signedIn = true;
    Notification.primary('Welcome '+user.email);
  });

    $rootScope.$on('auth:login-error', function(ev,reason) {
    $rootScope.signedIn = false;
    var errmsg = reason.errors[0];
    Notification.error({message: errmsg , delay: 10000});
  });    

    $rootScope.$on('auth:session-expired', function(ev) {
         $rootScope.signedIn = false;
  Notification.error('Session has expired');
});

    $rootScope.$on('auth:logout-success', function(ev) {
        $rootScope.signedIn = false;
    Notification.primary('Goodbye');
});
    $rootScope.$on('auth:registration-email-error', function(ev, reason) {
      $rootScope.signedIn = false;
      var errmsg = reason.errors['full_messages'][0];
      Notification.error({message: errmsg , delay: 10000});
    // Notification.error("Registration failed: " + errmsg);
});

    $rootScope.$on('auth:email-confirmation-success', function(ev, user) {
       $rootScope.signedIn = true;
    Notification.success("Welcome, "+user.email+". Your account has been verified.");
});
       
    $rootScope.$on('auth:registration-email-success', function(ev, message) {
     Notification.success("A registration email was sent to " + message.email);
});

});