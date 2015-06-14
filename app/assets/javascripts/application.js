// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.purr
//= require best_in_place
//= require_tree .

$(document).ready(function () {
    $("#dashboard_selected_board_id").change(function () {
        window.location = '/dashboard' + '?selected_board_id=' + $(this).val()
    })
    $(init);
})


function init() {
    $("#sortable_list").sortable()
    $('.sortable').sortable({
        connectWith:'.sortable',
        cursor:'pointer',
        update:function (event, ui) {
            var list_id = $(this).attr('list_id')
            var updated_tasks = Array()
            $(this).find("div.task").each(function () {
                updated_tasks.push($(this).attr('task_id'))
            });
            $.ajax({
                url:'/tasks/update_tasks_position?updated_tasks=' + updated_tasks + '&list_id=' + list_id,
                type:'POST'
            })
        }
    }).droppable({
            drop:function (event, ui) {}
        });

}
$(document).ready(function () {
    $("form.new_task").submit(function () {
        var form = $(this);
        $.ajax({
            url:form.attr('action'),
            type:'POST',
            dataType:'JSON',
            data:form.serialize(),
            success:function (response) {
                form.before('<div class="task dragable" task_id=' + response.id + '>' + '<span class="best_in_place" id="best_in_place_task_' + response.id + '_title" data-url="/tasks/' + response.id + '" data-object="task" data-attribute="title" data-type="input">' + response.title + '</span>' + '</div>');
                init();
            }
        });
        return false;
    })

    $(function() {
        $( "#accordion" ).accordion({
            collapsible: true ,
            active: false
        });
    });

    $("form.new_priority_label").submit(function () {
        var form = $(this);
        $.ajax({
            url:form.attr('action'),
            type:'POST',
            dataType:'JSON',
            data:form.serialize(),
            success:function (response) {
                form.before('<div style=\"background-color:' + response.color + ';color: white\"' + '><strong>' + response.title + '</strong></div>');
            }
        });
        return false;
    });

    var task = null;
    var modal = $('#myModal');
    var modal_header = modal.find("h3")
    var task_description_field = modal.find("#task_description")

    $("div.task").on("dblclick", function(){
        task = $(this);
        modal_header.html(task.text());
        task_description_field.val(task.attr('description'))
        $("form#modal_update_task_form").attr('action', '/tasks/' + task.attr('task_id'))
        modal.modal('show')
    });
    $("form#modal_update_task_form").submit(function(){
        var form = $(this);
        $.ajax({
            url: form.attr('action'),
            dataType: 'JSON',
            type: 'POST',
            data: form.serialize(),
            success: function(response){
                task.attr('description', task_description_field.val());
                alert('task was updated')
            }
        })
        return false;
    })

})
