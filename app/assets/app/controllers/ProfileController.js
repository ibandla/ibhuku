 app.controller('ProfileCtrl', function($scope) {

  $scope.vm = this; // vm stands for "View Model" --> see https://github.com/johnpapa/angular-styleguide#controlleras-with-vm
  $scope.vm.user = {};

  $scope.vm.userFields = [
    {
      // the key to be used in the model values
      // so this will be bound to vm.user.username
      key: 'username',
      type: 'input',
      templateOptions: {
        type: "text",
        label: "Username",
        pattern: "[a-zA-Z]+",
        required: true,
        description: 'Username'
      }
    },
    {
      key: 'password',
      type: 'input',
      templateOptions: {
        type: 'password',
        label: 'Password',
        required: true
      },
      expressionProperties: {
        'templateOptions.disabled': '!model.username' // disabled when username is blank
      }
    }
  ];
  
  $scope.vm.onSubmit = onSubmit;
  
  
  function onSubmit() {
    console.log('form submitted:', $scope.vm.user);
  }


});
