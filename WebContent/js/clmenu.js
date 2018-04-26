$(document).ready(function()
{

$('.RowToClick').click(function ()
 {
     $(this).nextAll('tr').each( function()
     {
	 if ($(this).is('.RowToClick'))
	{
	   return false;
	}
	$(this).toggle(100);
     });
 });

$('tr.RowToClick') 
.css("cursor","pointer")
.attr("title","Click to display detailed information")

$('tr.MasterClick') 
.css("cursor","pointer")
.attr("title","Click  to display detailed information")

$('.MasterClick').click(function ()
 {
	$(this).nextUntil('MasterClick').toggle(100);
 });

$('tr[class^=Child]').show();
$('tr[class^=GrandChild]').hide();
});

