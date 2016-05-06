app.run(function($rootScope, $location,Notification,ngCart) {
    $rootScope.$on('auth:login-success', function(ev, user) {
    $location.path('/home');
    Notification.primary('Welcome '+user.email);
  });

    $rootScope.$on('auth:login-error', function(ev,reason) {
    var errmsg = reason.errors[0];
    Notification.error({message: errmsg , delay: 10000});
  });    

    $rootScope.$on('auth:session-expired', function(ev) {
  Notification.error('Session has expired');
});

    $rootScope.$on('auth:logout-success', function(ev) {
    Notification.primary('Goodbye');
});
    $rootScope.$on('auth:registration-email-error', function(ev, reason) {
      var errmsg = reason.errors['full_messages'][0];
      Notification.error({message: errmsg , delay: 10000});
});

    $rootScope.$on('auth:email-confirmation-success', function(ev, user) {
    Notification.success("Welcome, "+user.email+". Your account has been verified.");
});
       
    $rootScope.$on('auth:registration-email-success', function(ev, message) {
     Notification.success("A registration email was sent to " + message.email);
     $location.path('/home');
});

    $rootScope.$on('auth:password-reset-request-success', function(ev, data) {
     Notification.success("Password reset instructions were sent to " + data.email);
     $location.path('/home');
});

    $rootScope.$on('auth:password-reset-request-error', function(ev, resp) {
    Notification.error("Password reset request failed: " + resp.errors[0]);
});

  

});