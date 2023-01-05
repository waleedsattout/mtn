<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MTN._Default" %> <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


<!--
    
    
    151618
    
    
    
    -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <div class="slideshow-container">
    <div class="mySlides fade"><img src="/assets/images/6.jpg" /></div>
    <div class="mySlides fade"><img src="/assets/images/5.png" /></div>
    <div class="mySlides fade"><img src="/assets/images/4.jpg" /></div>
    <div class="mySlides fade"><img src="/assets/images/3.jpg" /></div>
    <div class="mySlides fade"><img src="/assets/images/2.jpg" /></div>
    <div class="mySlides fade"><img src="/assets/images/1.png" /></div>
    <a class="next" onclick="plus(1)">❯</a>
    <a class="previos" onclick="plus(-1)">❮</a>
    <div class="circles">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
      <span class="dot" onclick="currentSlide(4)"></span>
      <span class="dot" onclick="currentSlide(5)"></span>
      <span class="dot" onclick="currentSlide(6)"></span>
    </div>
  </div>
  <script>
    let sIndex = 1;
    showSlides(sIndex);

    function plus(n) {
      showSlides((sIndex += n));
    }

    function currentSlide(n) {
      showSlides((sIndex = n));
    }

    function showSlides(n) {
      let i;
      let slides = document.getElementsByClassName("mySlides");
      let dots = document.getElementsByClassName("dot");
      if (n > slides.length) {
        sIndex = 1;
      }
      if (n < 1) {
        sIndex = slides.length;
      }
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace("active", "");
      }
      slides[sIndex - 1].style.display = "block";
      dots[sIndex - 1].className += " active";
    }
  </script>
  <div>
    <div class="blueone">
      <div class="cont">
        <img src="/assets/images/9.png">
        <span>احسبها بالميغا</span>
        <span class="txt">حاسبة البيانات</span>
      </div>
      <div class="cont">
        <img src="/assets/images/8.png">
        <span>إعلانك سيصل للملايين</span>
        <span class="txt">الرسائل الإعلانية</span>
      </div>
      <div class="cont">
        <img src="/assets/images/7.png" />
        <span>اختر رقمك الجديد</span>
        <span class="txt">احجز رقمك</span>
      </div>
    </div>
    <div>
    
        <div>
<h1 style="text-align: center;">أحدث العروض</h1>
<br>
<!--  -->
<div class="graybtn">
  <button>الخدمات الرقمية</button>
</div>
<br>
<!--  -->
<div class="PHOTOS2">
<div class="row">
  <div class="column">
    <img src="/assets/images/2.jpg" alt="Snow" style="width: 100%;">
  <br>
  <h3>MTN راديو</h3>
  </div>
  <div class="column">
    <img src="/assets/images/10.png" alt="Forest" style="width: 100%;">
  <br>
  <h3>MTN كشك</h3>
  </div>
  <div class="column">
    <img src="/assets/images/4.jpg" alt="Mountains" style="width:100%">
  <br>
  <h3>MTN TV</h3>
  </div>
</div>
</div>
<div class="grayone"><a href="https://twitter.com/MTNSY" class="fa fa-twitter"></a>
<a href="https://www.linkedin.com/company/mtn-syria" class="fa fa-linkedin"></a>
<a href="https://www.instagram.com/mtnsyria/" class="fa fa-instagram"></a>
<a href="https://youtube.com/MTNSY" class="fa fa-youtube"></a>
<a href="http://www.facebook.com/MTNSY" class="fa fa-facebook"></a>
</div>

    </div>
    </div>
</asp:Content>