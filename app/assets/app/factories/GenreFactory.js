app.factory('Genre', function(Restangular) {
   
    function all() {
     return Restangular.all('genre').getList().$object;
    }
    
    function one(id) {
     return Restangular.one('genre', id).get().$object;
    }
    
    return {
      all: all,
      one: one
    }

  });



