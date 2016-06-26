app.run(function($rootScope, $location,Notification,Cart,$state) {

    $rootScope.$on('ngCart:itemAdded', function(ev, ngCartItem) {
    Notification.success(ngCartItem.getName() + ' added to cart.');
    Cart.add(ngCartItem);
    
  });

    $rootScope.$on('ngCart:itemRemoved', function(ev,ngCartItem) {  
    Notification.error(ngCartItem.getName() + ' removed from cart.');
    Cart.remove(ngCartItem);
  });    

    $rootScope.$on('ngCart:change', function(ev) {
    	console.log ( 'Cart Manipulated' );
  });

    $rootScope.state = $state.current.name;

});

