function activateMainNavBarButtons () {
    var path_name = window.location.pathname;

    $('a[href="' + path_name + '"]').parent().addClass('active');
}

function activateRecordsNavBarButtons() {
    var path_name = window.location.pathname.substr(7);

}

$('document').ready(function () {
    activateMainNavBarButtons();
    activateRecordsNavBarButtons();
});