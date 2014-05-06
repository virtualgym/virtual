$(function () {
    $('#exercise_search input').keyup(function () {
        $.get($("#exercise_search").attr("action"), $("#exercise_search").serialize(), null, 'script');
        return false;
    });
});