<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />

<div class="container boxed">
    <section class="slider">
      <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class=""></li>
          <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        </ol>
        <div class="carousel-inner">
          <div class="item"> <img data-src="${path}/assets/images/slider/banner1_1.jpg" alt="First slide" src="${path}/assets/images/slider/banner1_1.jpg">
            <div class="container">
              <div class="carousel-caption">
                <h1>Sodales <span>Accumsan</span></h1>
                <p>Lacus volutpat, dignissim scelerisque felis</p>
                <p><a class="btn btn-default" href="#" role="button">buy now</a><a class="btn btn-default" href="#" role="button">learn more</a></p>
              </div>
            </div>
          </div>
          <div class="item active"> <img data-src="${path}/assets/images/slider/banner1.jpg" alt="Second slide" src="${path}/assets/images/slider/banner1.jpg">
            <div class="container">
              <div class="carousel-caption">
                <h1>Quisque <span>vul</span>putate</h1>
                <p>Aliquam hendrerit imperdiet nulla eu pretium</p>
                <p><a class="btn btn-default" href="#" role="button">order</a><a class="btn btn-default" href="#" role="button">details</a></p>
              </div>
            </div>
          </div>
          <div class="item"> <img data-src="${path}/assets/images/slider/banner18.jpg" alt="First slide" src="${path}/assets/images/slider/banner18.jpg">
            <div class="container">
              <div class="carousel-caption">
                <h1><span>Morbi</span> sodales</h1>
                <p>Phasellus pellentesque vehicula magna sit</p>
                <p><a class="btn btn-default" href="#" role="button">purchase</a><a class="btn btn-default" href="#" role="button">why us</a></p>
              </div>
            </div>
          </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon carousel-control-left"></span></a> <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon carousel-control-right"></span></a> </div>
    </section>
    <!--end of sldier section--> 
  </div>