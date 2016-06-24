 app.controller('CheckoutCtrl', function(Cart,Notification,$rootScope,$scope,StripeCheckout,ngCart,$log,Checkout) {

   $scope.hello = "Hello World!";
   $scope.ngCart = ngCart;
   $scope.items = ngCart.getCart().items;

		 var handler = StripeCheckout.configure({
		              name: "Ibhuku",
		               currency: "KES",
		              token: function(token, args) {
		              	Checkout.charge(token.id);
                    Cart.empty();
		                $log.debug("Got stripe token: " + token.id);

		              }
		          });
           $scope.doCheckout = function(token, args) {
                
            var options = {

              source: token,
              currency: "KES",
              description: "Thank you for your purchase, please enjoy!",
              amount: ngCart.totalCost()*100,
             
            };
           
            handler.open(options)
              .then(function(result) {
             Notification.success('Purchase Made');             
              },function() {
             Notification.success('Payment failed please try again');
              });
          };
   });