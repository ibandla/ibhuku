app.controller ('HomeCtrl', function($scope,Ebook,$http,$auth,$rootScope,Restangular) {

  $scope.ebooks = Ebook.pdfdata();
    var docDefinition = {
      content: [
        {
          text: 'IBHUKU CATALOG', style: 'header'
        },
        {
          style: 'demoTable',
          table: {
            widths: ['*', '*', '*','*','*'],
            body: [
              [{text: 'Title', style: 'header'}, {text: 'Author', style: 'header'}, {text: 'Category', style: 'header'},
                {text: 'ISBN', style: 'header'},{text: 'Price', style: 'header'}
              ],

              ]
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

    $scope.openPdf = function() {
        pdfMake.createPdf(docDefinition).open();
      };

    $scope.downloadPdf = function() {
        pdfMake.createPdf(docDefinition).download();
      };
});
