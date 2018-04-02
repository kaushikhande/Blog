(function poll(){
   setTimeout(function(){
      $.ajax({ url: "/show1", beforeSend: function() {
           $('#loader').hide();
        },  success: function(data){
        
        console.log(data.result);
        if(data.result === 'success') {
            $('#loader').hide();
            alert('It was success');
        } else if (data.result === 'failure') {
            $('#loader').hide();
            alert('It failed');
             $('#status').html('Payment processing failed.')
        } else if (data.result === 'pending') {
            //Setup the next poll recursively
            $('#loader').hide();
            poll();         
        }
      }, dataType: "json"});
  }, 5000);
})();

