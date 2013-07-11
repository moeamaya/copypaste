
$(document).ready(function(){
  $('#link_address').click( function(){
    $(this).select();
  })

  $('.comments').click( function() {
    $('.comments-hide').slideDown();
  })



  $('#link_address').bind("focus", clear_search);

  function clear_search(){
    $('#spinner').slideUp();
    $('#title_hide').slideUp();
  }

  // Or you can paste your URL directly to your input box.
  $('#link_address').bind("paste", parse_link);

  // Get website information.
  function parse_link(){
    $('#spinner').slideDown();
    setTimeout(function() {

      $.ajax({
        type: "GET",
        url: '/search?'+'link='+$('#link_address').val(),

        processData: false,
        dataType: 'html',
        type: 'GET',
        timeout: 3000,
        success: function(response){
          $('#spinner').hide();
          $('#title_hide').slideDown();
          $('#link_title').val(response);
          $('#link_name').delay(1000).focus();
        },
        error: function(request, status, error){
          alert(status)
        }
      })//ajax
    }, 500 )
  };


})//document ready