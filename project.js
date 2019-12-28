var i = 0;
var img = ['xx.jpg', 'ao.jpg', 'ao3.jpg', 'ao4.jpg'];
var slide = document.getElementsByClassName('p1');

function changeImg() {
  if (i < img.length) {
    slide[0].style.backgroundImage = `url('` + img[i] + `')`;
    i++;
  } else {
    i = 0;
  }
  setTimeout('changeImg()', 3000);
}
window.onload = changeImg();

function check() {
  var e = document.getElementById('email');
  var c = true;
  var mau=/^[a-zA-Z0-9]+[@][a-zA-Z]+([.][a-zA-Z]+){1,2}$/;
  if(mau.test(e.value)==false) {
    e.style.border="1px solid red";
    c = false;
  }
  else {
    e.style.border = "none";
    e.style.borderBottom = "1px solid white";
  }
  if (c == true) {
    window.alert("Đăng ký thành công, chào mừng bạn đến với gia đình A.ZY")
  }
}
