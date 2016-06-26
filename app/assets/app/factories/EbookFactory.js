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

    function downloadPdf() {

        var basedata = Restangular.all('pdfdata');
        basedata.getList().then(function(books) {
        var docDefinition = {
      content: [
        {
          text: 'IBHUKU CATALOG', style: 'header'
        },
        {
          style: 'demoTable',
          table: {
            widths: ['*', '*', '*','*','*'],
            body: books
          },
          layout: 'lightHorizontalLines'
        }
      ],
      styles: {
        header: {
          bold: true,
          color: '#000',
          fontSize: 11,
          alignment: 'center'
        },
        demoTable: {
          color: '#666',
          fontSize: 10
        }
      }
    };

        pdfMake.createPdf(docDefinition).download();

        });
  
      }

       function openPdf() {

        var basedata = Restangular.all('pdfdata');
        basedata.getList().then(function(books) {
        var docDefinition = {
      content: [
        {
          text: 'IBHUKU CATALOG', style: 'header'
        },
        {
          style: 'demoTable',
          table: {
            widths: ['*', '*', '*','*','*'],
            body: books
          },
          layout: 'lightHorizontalLines'
        }
      ],
      styles: {
        header: {
          bold: true,
          color: '#000',
          fontSize: 11,
          alignment: 'center'
        },
        demoTable: {
          color: '#666',
          fontSize: 10
        }
      }
    };

        pdfMake.createPdf(docDefinition).open();

        });
  
      }
    
    return {
      all: all,
      one: one,
      purchases: purchases,
      downloadPdf: downloadPdf,
      openPdf: openPdf
    }

  });



