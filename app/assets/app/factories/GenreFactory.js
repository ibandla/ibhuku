app.factory('Genre', function(Restangular,$log) {
   
    function all() {
     return Restangular.all('genre').getList().$object;
    }
    
    function one(id) {
     var x = Restangular.one('genre', id).get().$object;
     $log.debug(x);
     return x;
    }
    
    return {
      all: all,
      one: one
    }

  });



