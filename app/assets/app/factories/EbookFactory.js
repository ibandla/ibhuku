app.factory('Ebook', function(Restangular) {
   
    function all() {
     return Restangular.all('ebooks').getList().$object;
    }
    
    function one(id) {
     return Restangular.one('ebooks', id).get().$object;
    }
    
    return {
      all: all,
      one: one
    }

  });



