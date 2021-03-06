// scripts/searchFilter.js

  app.filter('isbnFilter', function($filter) {

    // The filter needs to return a function
    // that does the actual filtering

    return function(ebooks, searchParams){

    var text = searchParams["ISBN"];

    if (!text || text.length === 0)
      return ebooks;

    // split search text on space
    var searchTerms = text.split(' ');

    // search for single terms.
    // this reduces the item list step by step
    searchTerms.forEach(function(term) {
      if (term && term.length)
        ebooks = $filter('filter')(ebooks,{ISBN: term} );
    });

    return ebooks;
 };
 });
