// scripts/searchFilter.js

  app.filter('genreFilter', function($filter,$log) {

    

    return function(ebooks, selectedgenre){

    var catid = selectedgenre;
    if (catid==0)
      return ebooks;

    ebooks = $filter('filter')(ebooks, {category_id: catid});
  

    return ebooks;
 };
 });
