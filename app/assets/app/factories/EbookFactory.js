app.factory('Ebook', function(Restangular) {
   
    function all() {
     return Restangular.all('ebooks').getList().$object;
    }

    function purchased() {
     return Restangular.all('purchases').getList().$object;
    }
    
    function one(id) {
     return Restangular.one('ebooks', id).get().$object;
    }

    function random() {
     return Restangular.all('random').getList().$object;
    }
    
    return {
      all: all,
      one: one,
      purchases: purchases,
      random: random
    }

  });



