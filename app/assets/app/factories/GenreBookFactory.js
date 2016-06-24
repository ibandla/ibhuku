app.factory('GenreBook', function(Restangular) {
   
    function all(id) {
     return Restangular.one('genre', id).getList('ebook').$object;
    }
    
    function one(genre_id,id) {
     return Restangular.one('genre', genre_id).one('ebook', id).get().$object;
    }
    
    return {
      all: all,
      one: one
    }

  });



