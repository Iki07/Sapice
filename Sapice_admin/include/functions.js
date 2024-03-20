//f-ja koja sakriva iz menija link ka stranici na kojoj se korisnik trenutno nalazi
function hideMenuItem() {
    var currentPage = window.location.pathname.split('/').pop();
    //console.log("trenutna strana:" +currentPage);
    $('.list-group-item a').each(function () {
        var menuItemFileName = $(this).attr('href');
        console.log(menuItemFileName);
        if (menuItemFileName === currentPage) {
            $(this).parent().hide();
        }
    });
}

//f-ja koja prikazuje/sakriva polje se posebnim potrebama
function toggleSpecialNeeds() {
    $("#need1").click(function () {
        if ($(this).is(":checked")) {
            console.log("function tested");
            $("#special-needs").show();
        } else {
            $("#special-needs input[type='checkbox']").prop('checked', false);
            $("#special-needs").hide();
        }
    });
}

