// $(document).load(function () {
//  $( "#slider-range" ).slider({
//             range: true,
//             min: 0,
//             max: 1500,
//             values: [ 0, 1500 ],
//             click:function( event, ui ) {  $( "#amount" ).val( "KES " + ui.values[ 0 ] + " - KES " + ui.values[ 1 ] );
//             $("#minPrice").val( $( "#slider-range" ).slider( "values", 0 )).trigger('change');
//             $("#maxPrice").val( $( "#slider-range" ).slider( "values", 1 )).trigger('change');
//             },
//             slide: function( event, ui ) {  $( "#amount" ).val( "KES " + ui.values[ 0 ] + " - KES " + ui.values[ 1 ] );
//             $("#minPrice").val( $( "#slider-range" ).slider( "values", 0 )).trigger('change');
//             $("#maxPrice").val( $( "#slider-range" ).slider( "values", 1 )).trigger('change');
//             }
//  });

//   $("#minPrice").val( $( "#slider-range" ).slider( "values", 0 )).trigger('change');
//   $("#maxPrice").val( $( "#slider-range" ).slider( "values", 1 )).trigger('change');
// $( "#amount" ).val( "KES " + $( "#slider-range" ).slider( "values", 0 ) + " - KES " + $( "#slider-range" ).slider( "values", 1 ) );
  
// });

$(document).load(function () {
var slider = document.getElementById('slider-range');
  noUiSlider.create(slider, {
   start: [0, 1500],
   connect: true,
   step: 1,
   range: {
     'min': 0,
     'max': 1500
   }
   // format: wNumb({
   //   decimals: 0
   // })
  });


  var valueInput = document.getElementById('minPrice'),
    valueSpan = document.getElementById('maxPrice');

range.noUiSlider.on('update', function( values, handle ) {
    if ( handle ) {
        valueInput.value = values[handle];
    } else {
        valueSpan.innerHTML = values[handle];
    }
});

valueInput.addEventListener('change', function(){
    range.noUiSlider.set([null, this.value]);
});
});