app.factory('Ebook', function(Restangular) {

    function all() {
        return Restangular.all('ebooks').getList().$object;
    }

    function purchases() {
        return Restangular.all('purchases').getList().$object;
    }

    function random(){
        return Restangular.all('random').getList().$object;
    }

    function one(id) {
        return Restangular.one('ebooks', id).get().$object;
    }

    function docDefinition(books) {
        return {
            content: [{
                text: 'IBHUKU PRODUCT CATALOG',
                style: 'blam'
            }, {
                style: 'demoTable',
                table: {
                    widths: ['*', '*', '*', '*', '*'],
                    body: books
                },
                layout: 'lightHorizontalLines'
            }],
            styles: {
                blam: {
                  bold: true,
                  color: '#000',
                  fontSize: 16,
                  alignment: 'center',
                  margin: [0, 0, 0, 10]
                },
                header: {
                    bold: true,
                    color: '#000',
                    fontSize: 11,
                    alignment: 'center'
                },
                demoTable: {
                    color: '#666',
                    fontSize: 10,
                    alignment: 'center'
                }
            }
        };
    }

    function downloadPdf() {
        var basedata = Restangular.all('pdfdata');
        basedata.getList().then(function(books) {
            doc = docDefinition(books);
            pdfMake.createPdf(doc).download();
        });

    }

    function openPdf() {
        var basedata = Restangular.all('pdfdata');
        basedata.getList().then(function(books) {
            doc = docDefinition(books);
            pdfMake.createPdf(doc).open();
        });

    }

    return {
        all: all,
        one: one,
        purchases: purchases,
        downloadPdf: downloadPdf,
        openPdf: openPdf,
        random: random
    }
});
