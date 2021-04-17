function pullDown() {
  const pullDownButton = document.getElementById("lists");
  const pullDownMenu = document.getElementById("pull-down");
  const tableData = document.getElementById("table-data");

  pullDownButton.addEventListener("click", function() {
    if (pullDownMenu.getAttribute("style") == "display:block;") {
      pullDownMenu.removeAttribute("style", "display:none;");
      tableData.removeAttribute("style", "height:120px;")
    } else {
      pullDownMenu.setAttribute("style", "display:block;");
      tableData.setAttribute("style", "height:120px;")
    }
  });
};

window.addEventListener("load", pullDown);