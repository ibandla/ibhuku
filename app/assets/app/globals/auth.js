app.run(function($rootScope, $auth, $location, Notification, ngCart, Cart) {
    $rootScope.$on('auth:login-success', function(ev, user) {
        $location.path('/home');
        Notification.primary('Welcome ' + user.name);
        Cart.restore();
    });

    $rootScope.$on('auth:validation-success', function(ev, user) {
        Cart.restore();
    });

    $rootScope.$on('auth:validation-error', function(ev) {
        Notification.error('Please login to restore your session.');
        $location.path('/login');
        ngCart.empty();
    });

    $rootScope.$on('auth:password-change-success', function(ev) {
        $location.url($location.path());
        $auth.signOut();
        $location.path('/login');
        Notification.success("Your password has been successfully updated! Try logging in with your new password below.");
    });

    $rootScope.$on('auth:password-change-error', function(ev, reason) {
        Notification.error("Password change failed: " + reason.errors[0]);
        $location.path('/home');
    });

    $rootScope.$on('auth:login-error', function(ev, reason) {
        var errmsg = reason.errors[0];
        Notification.error({ message: errmsg, delay: 10000 });
    });

    $rootScope.$on('auth:session-expired', function(ev) {
        Notification.error('Session has expired, please login again.');
        $location.path('/login');
        ngCart.empty();
    });

    $rootScope.$on('auth:logout-success', function(ev) {
        Notification.primary('Goodbye');
        ngCart.empty();
    });
    $rootScope.$on('auth:registration-email-error', function(ev, reason) {
        var errmsg = reason.errors['full_messages'][0];
        Notification.error({ message: errmsg, delay: 10000 });
    });

    $rootScope.$on('auth:email-confirmation-success', function(ev, user) {
        Notification.success("Welcome, " + user.name + ". Your account has been verified.");
        $location.url($location.path());
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
