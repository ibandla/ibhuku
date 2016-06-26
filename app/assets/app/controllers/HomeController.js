 app.controller ('HomeCtrl', function($scope, $http,$auth,$rootScope,Restangular) {
 	// alert();
 		 // $scope.test =	Restangular.all('cart');

 		 // $scope.test = Restangular.all('cart').getList();

    // $scope.test = Restangular.all('cart').getList().$object;

    $scope.test = $rootScope.user;

    // var docDefinition = {
    //   content: [
    //     {
    //       text: 'IBHUKU CATALOG', style: 'header'
    //     },
    //     {
    //       style: 'demoTable',
    //       table: {
    //         widths: ['*', '*', '*','*','*'],
    //         body: [
    //           [{text: 'Title', style: 'header'}, {text: 'Author', style: 'header'}, {text: 'Category', style: 'header'},
    //             {text: 'ISBN', style: 'header'},{text: 'Price', style: 'header'}
    //           ],
    //
    //           ]
    //       },
    //       layout: 'lightHorizontalLines'
    //     }
    //   ],
    //   styles: {
    //     header: {
    //       bold: true,
    //       color: '#000',
    //       fontSize: 11,
    //       alignment: 'center'
    //     },
    //     demoTable: {
    //       color: '#666',
    //       fontSize: 10
    //     }
    //   }
    // };

    var externalDataRetrievedFromServer = [
    { name: 'Bartek', age: 34 },
    { name: 'John', age: 27 },
    { name: 'Elizabeth', age: 30 },
];

    function buildTableBody(data, columns) {
    var body = [];

    body.push(columns);

    data.forEach(function(row) {
        var dataRow = [];

        columns.forEach(function(column) {
            dataRow.push(row[column].toString());
        })

        body.push(dataRow);
    });

    return body;
}

function table(data, columns) {
    return {
        table: {
            headerRows: 1,
            body: buildTableBody(data, columns)
        }
    };
}

var dd = {
    content: [
        { text: 'Dynamic parts', style: 'header' },
        table(externalDataRetrievedFromServer, ['name', 'age'])
    ]
}
    $scope.openPdf = function() {
        pdfMake.createPdf(dd).open();
      };

    $scope.downloadPdf = function() {
        pdfMake.createPdf(docDefinition).download();
      };
});
