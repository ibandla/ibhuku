app.run(function($log, StripeCheckout) {     
   
          StripeCheckout.defaults({
            opened: function() {
              $log.debug("Stripe Checkout opened");
            },
            closed: function() {
              $log.debug("Stripe Checkout closed");
            }
          });


 });