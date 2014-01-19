
$(document).ready(function(){

  $('#links_address').click( function(){
    $(this).select();
  });

  $('.links').children().first().css('background', '#e6e6e6');

  var current;

  $('.link').click( function() {

    // hide all the children divs
    $('.comments').children().hide();
    $('.mobile-back').show();

    // set background color
    $(this).siblings().css('background', '');
    $(this).css('background', '#e6e6e6');

    // show the comments for this link
    var id = $(this).attr('id');
    var comm = '#c' + id;

    // set global variable
    current = comm;

    // check if in mobile state
    if ($('.comments').hasClass("close")){
      $('.comments').removeClass('close').addClass('open');
    } else {
      $('.comments').removeClass('open').addClass('close');
    }

    //TODO
    //adjust slide speed to number of comments
    $( comm ).slideDown('fast');
   });


  $('.mobile-back').click( function(){
    // check if in mobile state
    if ($('.comments').hasClass("close")){
      $('.comments').removeClass('close').addClass('open');
    } else {
      $('.comments').removeClass('open').addClass('close');
    }
  })

  $('#links_address').bind("focus", clear_search);

  function clear_search(){
    $('#spinner').slideUp();
    $('#title_hide').slideUp();
  };

  // Or you can paste your URL directly to your input box.
  $('#links_address').bind("paste", parse_link);

  // Get website information.
  function parse_link(){
    $('#spinner').slideDown('fast');
    setTimeout(function() {
      var url = $('#links_address').val();
      console.log(url);

      $.ajax({
        type: "GET",
        url: '/search?'+'links=' + url,

        processData: false,
        dataType: 'html',
        type: 'GET',
        timeout: 5000,
        success: function(response){
          $('#spinner').hide();
          $('#title_hide').slideDown();
          var r = JSON.parse(response)
          var res = r.table
          $('#links_title').val(res.title);
          $('#links_description').val(res.description);
          $('#links_thumbnail').val(res.images[0].url);
          $('#thumbnail').attr('src', res.images[0].url);
          $('#links_name').delay(1000).focus();
        },
        error: function(request, status, error){
          alert(status)
        }
      });
    }, 500 )
  };


})//document ready
