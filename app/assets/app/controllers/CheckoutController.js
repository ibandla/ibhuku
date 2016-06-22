 app.controller('CheckoutCtrl', function($scope,StripeCheckout,ngCart,$log) {

   $scope.hello = "Hello World!";
		 var handler = StripeCheckout.configure({
		              name: "Custom Example",
		              token: function(token, args) {
		                $log.debug("Got stripe token: " + token.id);
		              }
		          });
           $scope.doCheckout = function(token, args) {

           
            var options = {
              description: "Ten dollahs!",
              amount: 1000
            };
            // The default handler API is enhanced by having open()
            // return a promise. This promise can be used in lieu of or
            // in addition to the token callback (or you can just ignore
            // it if you like the default API).
            //
            // The rejection callback doesn't work in IE6-7.
            handler.open(options)
              .then(function(result) {
                alert("Got Stripe token: " + result[0].id);
              },function() {
                alert("Stripe Checkout closed without making a sale :(");
              });
          };
   });