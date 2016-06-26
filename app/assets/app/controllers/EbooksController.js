
 app.controller('EbooksCtrl', function($scope,Genre,$log,Ebook,ngCart,GenreBook,$rootScope) {


  $scope.currentPage = 1;
  $scope.pageSize = 9;
  $scope.genres = Genre.all();
  $scope.genreparam = 0;
  $scope.unsetSelected = function(){
     $scope.selectedgenre = {};
       $scope.genreparam = 0;
  };

  $scope.setSelected = function(genre){
      $log.debug(genre);

       $scope.selectedgenre = genre;
       $scope.genreparam = genre.id;

  };

  $scope.ebooks = Ebook.all();
  $scope.searchParams = {
      "query":""
    };


    $scope.availableSearchParams = [
          { key: "title", name: "Title", placeholder: "Title..." },
          { key: "ISBN", name: "ISBN", placeholder: "ISBN..." },
          { key: "author", name: "Author", placeholder: "Author..." },
          { key: "description", name: "Description", placeholder: "Description..." }
        ];

  $scope.pageChangeHandler = function(num) {
      console.log('drinks page changed to ' + num);
  };

  $scope.priceInfo = {
    min: 0,
    max: 1500
  }

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




    // $scope.searchParams = {
    //   "query":""
    // };


    // $scope.availableSearchParams = [
    //       { key: "title", name: "Title", placeholder: "Title..." },
    //       { key: "ISBN", name: "ISBN", placeholder: "ISBN..." },
    //       { key: "author", name: "Author", placeholder: "Author..." },
    //       { key: "description", name: "Description", placeholder: "Description..." }
    //     ];


    });
