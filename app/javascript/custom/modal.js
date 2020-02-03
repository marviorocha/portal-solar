
const MicroModal = require('micromodal'); // commonjs module
        
MicroModal.init();

var $ = require('jquery');

function ready(event){

$('.consultaModal').click(function(){
    $('.modal').addClass('is-active');
});

$('.modal-close').click(function(){

    $('.modal').removeClass('is-active');

});
}

//  fix turbolinks:load
$(document).on('turbolinks:load', ready);

