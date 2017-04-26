function handleContextMenu (event) {
    var target;
    if (event.target.href) {
        target = event.target.href;
    } else {
        target = document.location.href;
    }
    safari.extension.setContextMenuEventUserInfo(event, {url: target});
}

//function handleLinkClick (event) {
//    if (event.target.href && event.ctrlKey && event.altKey) {
//        safari.extension.dispatchMessage("linkClicked", {url: event.target.href});
//        event.prefentDefault();
//        event.stopImmediatePropagation();
//    }
//}

//document.addEventListener("click", handleLinkClick, false);
document.addEventListener("contextmenu", handleContextMenu, false);
