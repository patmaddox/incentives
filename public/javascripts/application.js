jQuery(document).ready(function() {
    jQuery('.field').click(function() {
        var field_name = jQuery(this).text().toLowerCase();
        var new_field = jQuery('#' + field_name + '_template').clone();
        new_field.removeAttr('id');
        jQuery('#incentive_form input[type=submit]').before(new_field);
        jQuery('#incentive_form input[type=submit]').before('<br/><br/>');
    });
//     jQuery('.field').draggable();
//     jQuery('#incentive_fields').droppable({accept: '.field', drop: function(ev, ui) {
//         var item = jQuery(ui.draggable);
//         jQuery(this).append(item);
//     }});
});
