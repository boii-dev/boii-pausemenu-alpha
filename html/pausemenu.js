//------------------------------\\
//---\\ BOII | DEVELOPMENT //---\\
//------------------------------\\
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        // Envoyer un message au Lua pour fermer le menu
        fetch(`https://${GetParentResourceName()}/exit`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({})
        });
    }
});
$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var item = event.data;
            if (item.open == true) {
            $('#main-container').removeClass('hidden');
        } else if (item.open == false) {
            $('#main-container').addClass('hidden');
        }
    });
    $('.content-btn1').click(function(){
        $.post('http://boii-pausemenu/Close', JSON.stringify({}));2
        $('#rules-container').fadeOut(250);
        $('#news-container').fadeOut(250);
        $('#reports-container').fadeOut(250); 
    });
    $('.content-btn2').click(function(){
        $('#news-container').removeClass('hidden');
        $('#news-container').fadeIn(250);
        $('#rules-container').fadeOut(250);
        $('#reports-container').fadeOut(250); 
    });
    $('.content-btn3').click(function(){
        $('#news-container').fadeOut(250);
        $('#reports-container').fadeOut(250); 
        $('#rules-container').fadeIn(250);
    });
    $('.content-btn4').click(function(){
        $('#rules-container').fadeOut(250);
        $('#news-container').fadeOut(250);
        $('#reports-container').fadeIn(250);  
    });
    $('.content-btn5').click(function(){
        $('#rules-container').fadeOut();
        $.post('http://boii-pausemenu/Settings', JSON.stringify({}));
    });
    $('.content-btn6').click(function(){
        $('#rules-container').fadeOut();
        $.post('http://boii-pausemenu/DropPlayer', JSON.stringify({}));
    });
    $('#form-submit-btn').click(function(){
        if ($('#fname').val() === '' || $('#fname').val() === '' || $('#lname').val() === '' || $('#reporttype').val() === '' || $('#subject').val() === '' || $('#description').val() === '') {
            $('.form-container').fadeOut(250); 
            $('#form-alert-container').fadeIn(250); 
        } else {
        var fname = $('#fname').val()
        var lname = $('#lname').val()
        var reporttype = $('#reporttype').val()
        var subject = $('#subject').val()
        var description = $('#description').val()
        $.post('https://boii-pausemenu/NewReport', JSON.stringify({
            fname: fname,
            lname: lname,
            reporttype: reporttype,
            subject: subject,
            description: description,
        }));
        ClearForm();
        $('#reports-container').fadeOut();
        }   
    });
    $('.form-failed-btn').click(function(){
        $('#form-alert-container').fadeOut(250); 
        $('.form-container').fadeIn(250);   
    });
})

function ClearForm() {
	$('#fname').val('');
	$('#lname').val('');
    $('#reporttype').val('');
    $('#subject').val('');
    $('#description').val('');
}
