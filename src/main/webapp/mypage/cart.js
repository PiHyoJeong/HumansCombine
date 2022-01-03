function go_cart() {
  if (document.formm.quantity.value == "") {
    alert("호텔을 선택해 주세요.");
    document.formm.quantity.focus();
  } else {
  	document.formm.method = "post";
	document.formm.quantity.value == ""
    document.formm.action = "ProjectServlet?command=cartInsert";
    document.formm.submit();
  }
}

function go_cart_delete() {
  var count = 0;

  if (document.formm.cartSeq.length == undefined) {
    if (document.formm.cartSeq.checked == true) {
      count++;
    }
  }

  for ( var i = 0; i < document.formm.cartSeq.length; i++) {
    alert("" + document.formm.cartSeq[i].checked);
    if (document.formm.cartSeq[i].checked == true) {
      count++;
      alert("" + count);
    }
  }
  if (count == 0) {
    alert("삭제할 항목을 선택해 주세요.");

  } else {
    document.formm.action = "ProjectServlet?command=cartDelete";
    document.formm.submit();
  }
}

function go_order_insert() {
  document.formm.action = "ProjectServlet?command=orderInsert";
  document.formm.submit();
}

function go_order_delete() {
  var count = 0;

  if (document.formm.oseq.length == undefined) {
    if (document.formm.oseq.checked == true) {
      count++;
    }
  }

  for ( var i = 0; i < document.formm.oseq.length; i++) {
    if (document.formm.oseq[i].checked == true) {
      count++;
    }
  }
  if (count == 0) {
    alert("삭제할 항목을 선택해 주세요.");

  } else {
    document.formm.action = "ProjectServlet?command=orderDelete";
    document.formm.submit();
  }
}

function go_order() {
  document.formm.action = "ProjectServlet?command=mypage";
  document.formm.submit();
}


