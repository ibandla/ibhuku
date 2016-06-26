app.controller ('HomeCtrl', function($scope,Ebook,$http,$auth,$rootScope,Restangular) {

    var ebooks = Ebook.pdfdata();


    var docDefinition = {
      content: [
        {
          text: 'IBHUKU CATALOG', style: 'header'
        },
        {
          style: 'demoTable',
          table: {
            widths: ['*', '*', '*','*','*'],
            body: ebooks
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
        pdfMake.createPdf(dd).open();
      };

    $scope.downloadPdf = function() {
        pdfMake.createPdf(docDefinition).download();
      };
});
