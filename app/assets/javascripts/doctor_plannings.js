$(document).on('turbolinks:load', function(){


    $('#doctor-planning-modal').on('shown.bs.modal', function() {
        // Get doctor by service
        ajaxFilterPost("#doctor_planning_service_id", "/doctor_plannings/get_doctors", "GET");

    });
});