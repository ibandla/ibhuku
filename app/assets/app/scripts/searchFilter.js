// scripts/searchFilter.js

  app.filter('saerchFilter', function() {

    // The filter needs to return a function
    // that does the actual filtering
    return function(ebooks, searchParams) {

      // Empty array that will eventually contain
      // the filtered data
      // var query = searchParams["query"];
      var filtered = [];

      angular.forEach(ebooks, function(ebook) {

        if(query==ebook.title) {

          filtered.push(ebook);

        }

      });

      // Return the filtered array
      return filtered;
    }

  });
