app.factory('Cart', function(railsResourceFactory) {
      return railsResourceFactory({
        url: '/api/cart',
        name: 'cart'
    });
});