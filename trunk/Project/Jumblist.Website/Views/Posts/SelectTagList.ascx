<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tag>>" %>

<%--<style type="text/css">
.InPlaceEditTextBox
  {
      display:none;
  }
.InPlaceEditSpan
  {
      padding:5px;
      margin:2px;
  }
</style>

<script type="text/javascript">
    $(function() {
        $("#Edit").click(function() {
            if (!$('.InPlaceEditTextBox').is(':visible')) {
                $(".InPlaceEditSpan").fadeOut("fast", function() {
                    $(this).next(".InPlaceEditTextBox").val($(this).html());
                    $(".InPlaceEditTextBox").fadeIn();
                    $("#Edit").val("Save");
                });
            }
            else {
                $(".InPlaceEditTextBox").fadeOut("fast", function() {
                    $(".InPlaceEditSpan").fadeIn("fast", function() {
                        var textBoxId = $(this).attr("editTextBoxId");
                        $(this).html($("#" + textBoxId).val());
                        $(this).html($(this).next(".InPlaceEditTextBox").val());
                        $("#Edit").val("Edit");
                    });
                });
            }
        });
    });
</script>


<b>Tags</b><br />
<span class="InPlaceEditSpan"><%= Model.Select( x => x.Name ).ToFormattedStringList( "{0}, ", 2 )%></span>
<input type="text" size="5" name="tagSearch" class="InPlaceEditTextBox" />
<input type="button" id="Edit" value="Edit" />--%>


<b>Tags</b><br />
<%= Html.TextBox("tagSearch", Model.Select(x => x.Name).ToFormattedStringList("{0}, ", 2))%>


       