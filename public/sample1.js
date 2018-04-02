(function poll(){
   setTimeout(function(){
      $.ajax({ url: "show", success: function(data){
        console.log(data.result);
        if(data.result === 'success') {
            alert('It was success');
        } else if (data.result === 'failure') {
            alert('It failed');
        } else if (data.result === 'pending') {
            //Setup the next poll recursively
            poll();         
        }
      }, dataType: "json"});
  }, 5000);
})();

