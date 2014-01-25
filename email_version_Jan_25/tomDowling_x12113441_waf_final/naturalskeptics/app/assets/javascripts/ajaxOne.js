$(document).ready(function() {
//    alert('Message: Document Ready');

    $(".ajaxClass").click(function(e) {
//        alert('Message: Link in nav section clicked');

        url = $(this).attr("href");
        getPage(url);

        window.history.pushState('object', 'New Title', url);
        e.preventDefault();

    });

    function getPage(pageName) {
        pageURL = '' + pageName;
        $.ajax({
            url: pageURL,

            success: function(data){
                switch (pageName)
                {
                    case '/mygems':
                        $("#yieldId").html(data);
                        break;

                /*    case '/commodities':
                        $("#yieldId").html(data);
                        break;*/

                    default:
                        $("#yieldId").html(data);
                }
            },

            error: function(){
                $("#yieldId").text("Page not found!!");
            }
        });
    }

    // Forward and backward functions
    window.onpopstate = function(event) {
        console.log("pathname: " + location.pathname);
        loadNextPage(location.pathname);
    };
    function loadNextPage(nextPage) {
        var str = nextPage;
        var n = str.lastIndexOf('/');
        var result = str.substring(n + 1);
        getPage(result);
    }

});
