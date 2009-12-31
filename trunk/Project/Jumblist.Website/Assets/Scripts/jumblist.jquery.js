
$(document).ready(function() {
    convertLinksToLowerCase();
});

function convertLinksToLowerCase() {
    $("a").each(function() {
        this.href = this.href.toLowerCase();
    });
}

