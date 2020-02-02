(function (miloficios) {
    miloficios.getModal = getModalContent;
    miloficios.closeModal = closeModal;

    return miloficios;

    function getModalContent(url) {
        $.get(url, function (data) {
            $('.modal-body').html(data);
        });
    }

    function closeModal(option) {
        $("button[data-dismiss='modal']").click();
        $('.modal-body').html("");00000000000
        modifyAlertsClasses(option);
    }

    function modifyAlertsClasses(option) {
        $('#successMessage').addClass('hidden');
        $('#deleteMessage').addClass('hidden');
        $('#editMessage').addClass('hidden');

        if (option === 'create') {
            $('#successMessage').removeClass('hidden');
        }
        else if (option === 'delete') {
            $('#deleteMessage').removeClass('hidden');
        }
        else if (option === 'edit') {
            $('#editMessage').removeClass('hidden');
        }
    }

})(window.miloficios = window.miloficios || {});