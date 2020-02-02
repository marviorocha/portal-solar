 
  const $ = require("jquery");

  
$(document).ready(function($){

  // jQuery methods go here...
  $("input[name='sample']").change(function(){
    
   if(this.value == "sample"){

    $("#sample").show();
    $("#advanced").hide();

   } else if(this.value == "advanced") {
   
    $("#sample").hide();
    $("#advanced").show();

  }
 

  });  
  
   

});


 