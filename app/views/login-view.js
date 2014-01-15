application = require('application');
router = require('lib/router');

module.exports = LoginView = Backbone.Marionette.ItemView.extend({
    id: 'login-view',
    template: 'views/templates/login',
    events: {
        'submit form': 'submit'
    },

    submit: function(e) {
        e.preventDefault();
        username = $('#loginForm #username').val();
        password = $('#loginForm #password').val();
        $.ajax({
            contentType: 'application/json',
            type: "POST",
            url: "http://127.0.0.1:4000/login",
            data: JSON.stringify({
                username: username,
                password: password
            }),
            success: function(data){
                if(data.user_id && data.api_key){
                    application.user_id = data.user_id;
                    application.api_key = data.api_key;
                    Backbone.history.navigate('/rooms', true);
                }
            },
            error: function(){
                $('#loginForm #username').val('');
                $('#loginForm #password').val('');
            },
            dataType: "json"
        });
        console.log("Form submitted");
    }
});