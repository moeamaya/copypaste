
$(document).ready(function(){
  $('#link_address').click( function(){
    $(this).select();
  })


  /*
  Gets the height of display:none div for a smooth slideToggle
  animation
  */
  function getHeight(id) {
    $(id)
    .css({
        position:   'absolute',
        visibility: 'hidden',
        display:    'block'
      });

    optionHeight = $(id).height();
    console.log(optionHeight )

    $(id)
    .css({
        position:   'static',
        visibility: 'visible',
        display:    'none',
        height:     optionHeight + 140,
      });
  }

  $('.comment-amount').click( function() {

    var id = $(this).attr('id');
    var comm = '#c' + id
    getHeight( comm )

    //TODO
    //adjust slide speed to number of comments

    $( comm ).delay(200).slideToggle('slow');
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