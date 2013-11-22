
$(document).ready(function(){

  $('#links_address').click( function(){
    $(this).select();
  })

  var current;

  $('.link').click( function() {
    // hide any previous div
    if (current) {
      $(current).hide();
    }
    // set background color
    $(this).siblings().css('background', '')
    $(this).css('background', '#e6e6e6');

    // show the comments for this link
    var id = $(this).attr('id');
    var comm = '#c' + id
    current = comm;

    //TODO
     //adjust slide speed to number of comments
     $( comm ).slideDown('fast');

   })


  $('#new_links').bind("focus", clear_search);

  function clear_search(){
    $('#spinner').slideUp();
    $('#title_hide').slideUp();
  }

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
          r = JSON.parse(response)
          res = r.table
          $('#links_title').val(res.title);
          $('#links_description').val(res.description);
          $('#links_thumbnail').val(res.images[0].url);
          $('#thumbnail').attr('src', res.images[0].url);
          $('#links_name').delay(1000).focus();
        },
        error: function(request, status, error){
          alert(status)
        }
      })//ajax
    }, 500 )
  };


})//document ready

var res