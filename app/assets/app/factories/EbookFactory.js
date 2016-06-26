app.factory('Ebook', function(Restangular) {
   
    function all() {
     return Restangular.all('ebooks').getList().$object;
    }

    function purchases() {
     return Restangular.all('purchases').getList().$object;
    }

    
    function one(id) {
     return Restangular.one('ebooks', id).get().$object;
    }

    function pdfdata() {
     return Restangular.all('pdfdata').getList().$object;
    }
    
    return {
      all: all,
      one: one,
      purchases: purchases,
      pdfdata: pdfdata
    }

  });



