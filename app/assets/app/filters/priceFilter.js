// scripts/priceFilter.js

  app.filter('priceFilter', function() {

    // The filter needs to return a function
    // that does the actual filtering
    return function(ebooks, priceInfo) {

      // Empty array that will eventually contain
      // the filtered data
      var filtered = [];

      var min = priceInfo.min;
      var max = priceInfo.max;

      // Loop through each listing and check whether
      // the price value is in range
      angular.forEach(ebooks, function(ebook) {

        if(ebook.price >= min && ebook.price <= max) {

          // If the value is in range, push it onto the array
          filtered.push(ebook);
        }

      });

      // Return the filtered array
      return filtered;
    }

  });
