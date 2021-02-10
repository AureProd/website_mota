
(function (window, document) {
    window.onload = init;

    function getAccess() {
        $.ajax({
            url : "user/get_access",
            type : "GET",
            dataType : 'text',
            success : function(data) {
                let access = JSON.parse(data).access;

                if (access > 0) {
                    $(".login").hide();
                } else {
                    $("#logout").hide();
                }
        
                if (access < 10) {
                    $(".acces_dix").hide();
                }
            }
        });
    }

    function init() {
        getAccess();
    }
})(window, document);

