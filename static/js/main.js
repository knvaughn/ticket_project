var form_options = document.getElementById('form_options');
form_options.addEventListener('change', event => {
    var select_option = document.getElementById(event.target.value);
    var ticket_forms = document.querySelectorAll('#ticket_form form');
    for(var i = 0; i < ticket_forms.length; i++) {
        ticket_forms[i].classList.remove('active');
    }
    if(select_option !== null) {
        select_option.classList.add('active');
    }
});