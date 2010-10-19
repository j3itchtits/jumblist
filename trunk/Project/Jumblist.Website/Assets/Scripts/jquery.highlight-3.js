/*

highlight v3

Highlights arbitrary terms.

<http://johannburkard.de/blog/programming/javascript/highlight-javascript-text-higlighting-jquery-plugin.html>

MIT license.

Johann Burkard
<http://johannburkard.de>
<mailto:jb@eaio.com>

*/

jQuery.fn.highlight = function(pat) {

    if (pat.length == 0) return;

    return this.each(function() {
        var array = pat.split("+");
        for (i = 0; i < array.length; i++) {
            innerHighlight(this, array[i].toUpperCase());
        }    
        
    function innerHighlight(node, pat) {
        var skip = 0;
        if (node.nodeType == 3) {
            var pos = node.data.toUpperCase().indexOf(pat);
            if (pos >= 0) {
                var spannode = document.createElement('span');
                spannode.className = 'highlight';
                var middlebit = node.splitText(pos);
                var endbit = middlebit.splitText(pat.length);
                var middleclone = middlebit.cloneNode(true);
                spannode.appendChild(middleclone);
                middlebit.parentNode.replaceChild(spannode, middlebit);
                skip = 1;
            }
        }
        else if (node.nodeType == 1 && node.childNodes && !/(script|style)/i.test(node.tagName)) {
            for (var i = 0; i < node.childNodes.length; ++i) {
                i += innerHighlight(node.childNodes[i], pat);
            }
        }
        return skip;
    }
    });
};

jQuery.fn.removeHighlight = function() {
    return this.find("span.highlight").each(function() {
        this.parentNode.firstChild.nodeName;
        with (this.parentNode) {
            replaceChild(this.firstChild, this);
            normalize();
        }
    }).end();
};


/*

end plugin

*/

jQuery.fn.highlightlink = function(str, className) {
    if (str.length == 0) return;
    var regex = new RegExp(str, "gi");

    return this.each(function() {
        var bodytext = $(this).html().replace(regex, "<b>" + str + "</b>");
        $(this).html(bodytext);
    });
};

jQuery.fn.highlight2 = function(str) {
    if (str.length == 0) return;
    var regex = new RegExp(str, "ig");

    return this.each(function() {
        var bodytext = $(this).html().replace(regex, "<span class='highlight'>" + str + "</span>");
        $(this).html(bodytext);
    });
};

jQuery.fn.highlight3 = function(what) {

    return this.each(function() {
        var container = this,
            content = container.innerHTML,
            pattern = new RegExp('(>[^<.]*)(' + what + ')([^<.]*)', 'ig'),
            replaceWith = '$1<span class="highlight">$2</span>$3',
            highlighted = content.replace(pattern, replaceWith);
        container.innerHTML = highlighted;
    });
}