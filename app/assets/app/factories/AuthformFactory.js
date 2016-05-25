app.factory('Authform', function(Title,$rootScope) {

    var halfpassword = {
        className: 'col-md-6',
        key: 'password',
        type: 'input',
        templateOptions: {
            type: 'password',
            label: 'Password',
            theme: "altThemeWide",
            required: true
        }
    };
    var newpassword_full = {
        className: 'col-md-6',
        key: 'password',
        type: 'input',
        templateOptions: {
            type: 'password',
            label: 'New Password',
            theme: "altThemeWide",
            required: true
        }
    };


    var newpassword = {
        className: 'col-md-6',
        key: 'password',
        type: 'input',
        templateOptions: {
            type: 'password',
            label: 'New Password',
            theme: "altThemeWide",
            required: true
        }
    };

    var fullpassword = {
        className: 'col-md-12',
        key: 'password',
        type: 'input',
        templateOptions: {
            type: 'password',
            label: 'Password',
            theme: "altThemeWide",
            required: true
        }
    };

    var password_conf = {

        className: 'col-md-6',
        key: 'password_confirmation',
        type: 'input',
        templateOptions: {
            type: 'password',
            label: 'Password Confirmation',
            theme: "altThemeWide",
            required: true
        }
    };
    var password_conf_full = {

        className: 'col-md-12',
        key: 'password_confirmation',
        type: 'input',
        templateOptions: {
            type: 'password',
            label: 'Password Confirmation',
            theme: "altThemeWide",
            required: true
        }
    };



    var current_password = {
        className: 'col-md-12',
        key: 'current_password',
        type: 'input',
        templateOptions: {
            type: 'password',
            label: 'Current Password',
            theme: "altThemeWide",
            required: true
        }
    };

    var email = {
        className: 'col-md-12',
        key: 'email',
        type: 'input',
        templateOptions: {
            type: 'email',
            label: 'Email address',
            theme: "altThemeWide",
            required: true
        }
    };

    var title = {
        className: "col-md-2",
        type: "select",
        key: "title_id",
        templateOptions: {
            label: "Title",
            theme: "altTheme",
            labelProp: "name",
            valueProp: "id",
            options: Title.all(),
            required: true
        }
    };

   
    var name = {
        className: "col-md-10",
        key: 'fullname',
        type: 'input',
        templateOptions: {
            label: 'Name',
            theme: "altThemeWide",
            pattern: "[a-zA-Z ]+",
            patternValidationMessage: "No symbols allowed",
            required: true
        }
    };




    function login() {
        return [email, fullpassword];
    }

    function register() {
        return [title, name, email, halfpassword, password_conf];
    }

    function reset() {
        return [email];
    }

    function resetpass() {
        return [newpassword_full, password_conf_full];
    }

    function updatepass() {
        return [current_password, newpassword, password_conf];
    }

    function updateprofile() {
        return [title, name];
    }

    return {
        login: login,
        register: register,
        reset: reset,
        resetpass: resetpass,
        updatepass: updatepass,
        updateprofile: updateprofile
    }

});
