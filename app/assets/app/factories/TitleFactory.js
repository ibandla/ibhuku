app.factory('Title', function(Restangular) {
   
    function all() {
     return Restangular.all('titles').getList().$object;
    }
    
    return {
      all: all
    }

  });



