 const $ = require("jquery");
 
 function ready(event) {

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
};
// fix turbolink 
$(document).on('turbolinks:load', ready);