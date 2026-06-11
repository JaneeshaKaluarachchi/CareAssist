<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Saira' rel='stylesheet'>
    <link rel="stylesheet" href="css/home.css">
   



    <link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <title>Doctor Consultation</title>
    
</head>
<body>

	<jsp:include page="navbarPatient.jsp" />
	

    <div class="container">
        <div class="image-section">
            <img src="assert/herosecimg2.png" alt="Doctor Consultation">
        </div>
        <div class="text-section">
            <div class="title">
                Instant doctor <span class="highlight">consultations</span>, <br> right at your <span class="emphasis">fingertips</span>.
            </div>
            <div class="paragraph">
                Skip the traffic, crowded hospital waiting rooms and exposure to germs and channel a doctor from the comfort of your home.
            </div>
            <div class="buttons">
                <a href="#" class="ticket-btn">Raise a Ticket</a>
            </div>
        </div>
    </div>




    






    <div class="consult-container">
        <h1 class="consult-title">Consulting a <span class="highlight">Doctor</span> has never<br>been this <span class="emphasis">easy</span>.</h1>
    
        <div class="consult-content">
            <div class="consult-steps-group">
                <div class="consult-step-item">
                    <span class="step-number">01</span>
                    <p class="step-text">Select your preferred doctor</p>
                </div>
                <div class="consult-step-item">
                    <span class="step-number">02</span>
                    <p class="step-text">Select your preferred date and time</p>
                </div>
                <div class="consult-step-item">
                    <span class="step-number">03</span>
                    <p class="step-text">Send any messages, pictures, or reports to your doctor</p>
                </div>
            </div>
    
            <div class="consult-phone">
                <img src="assert/docapp.png" alt="Doctor App">
            </div>
    
            <div class="consult-steps-group consult-right">
                <div class="consult-step-item">
                    <span class="step-number">04</span>
                    <p class="step-text">The doctor will call you at the scheduled appointment time.</p>
                </div>
                <div class="consult-step-item">
                    <span class="step-number">05</span>
                    <p class="step-text">They will send you the prescription through the app</p>
                </div>
                <button class="consult-button" onclick="channelNow()">Channel Now</button>
            </div>
        </div>
    </div>
    
    









    <br><br>

    <div class="cao-section">
        <div class="cao-box pharmacy">
          <div class="cao-content">
            <h2>CAO PHARMACY</h2>
            <p>Your paragraph text qwertyzxcvbnzcvbnsedrfgh dfg dfg sdfgh sdfgh dfg...</p>
            <div class="cao-actions">
              <a href="#" class="read-more">Read More -></a>
              <button class="btn dark">Order Now</button>
            </div>
          </div>
        </div>
      
        <div class="cao-box labs">
          <div class="cao-content">
            <h2>CAO LABS</h2>
            <p>Your paragraph text qwertyzxcvbnzcvbnsedrfgh dfg dfg sdfgh sdfgh dfg...</p>
            <div class="cao-actions">
              <button class="btn dark">Test Now</button>
              <a href="#" class="read-more">Read More -></a>
            </div>
          </div>
        </div>
      </div>
    

      <br><br>












      <div class="review-section">
        <h2>Patient Reviews</h2>
        <div class="swiper-container">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <div class="review-card">
                <div class="stars">★★★★★</div>
                <p class="review-message">"Care Assist Online made it so easy to book my consultation. The doctor was professional and kind. I didn’t expect online healthcare to be this smooth. Definitely using this service again for my follow-ups and prescriptions."</p>
                <p class="review-name">S M L Samarakoon</p>
                <p class="review-date">May 05, 2025</p>
              </div>
            </div>
            <div class="swiper-slide">
              <div class="review-card">
                <div class="stars">★★★★★</div>
                <p class="review-message">"I was able to talk to a mental health specialist without leaving home. The platform is secure, user-friendly, and affordable. It really helped me during a difficult time. Thank you for providing such accessible care."</p>
                <p class="review-name">Janet Kaluarachchi</p>
                <p class="review-date">May 01, 2025</p>
              </div>
            </div>

            <div class="swiper-slide">
                <div class="review-card">
                  <div class="stars">★★★★★</div>
                  <p class="review-message">"This platform saved me hours! I scheduled a lab test and had results the same day. The interface is easy to use and the support team is responsive. I highly recommend Care Assist Online to anyone needing fast, reliable healthcare."</p>
                  <p class="review-name">Lal Silva</p>
                  <p class="review-date">April 18, 2025</p>
                </div>
              </div>

              <div class="swiper-slide">
                <div class="review-card">
                  <div class="stars">★★★★★</div>
                  <p class="review-message">"I was skeptical at first, but Care Assist Online proved me wrong. My nutrition consultation was informative and personalized. It’s great to see technology making healthcare more convenient and inclusive. Five stars from me."</p>
                  <p class="review-name">N Gamage</p>
                  <p class="review-date">April 04, 2025</p>
                </div>
              </div>

              <div class="swiper-slide">
                <div class="review-card">
                  <div class="stars">★★★★★</div>
                  <p class="review-message">"Very satisfied with the service. I had a video consultation with a doctor within 15 minutes of signing up. No queues, no travel, and the advice was just as good as an in-person visit. Highly recommend for busy professionals."</p>
                  <p class="review-name">Chandrika Withanage</p>
                  <p class="review-date">March 13, 2025</p>
                </div>
              </div>

              <div class="swiper-slide">
                <div class="review-card">
                  <div class="stars">★★★★★</div>
                  <p class="review-message">"My prescription was delivered to my door in less than two hours! This level of convenience is unmatched. Care Assist Online has become my go-to for anything health-related. Excellent platform with great features and reliable doctors."</p>
                  <p class="review-name">Saman Rathnayake</p>
                  <p class="review-date">March 01, 2025</p>
                </div>
              </div>
            <!-- Add more swiper-slide elements as needed -->
          </div>
        </div>
      </div>




      <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

      <script>
        const swiper = new Swiper('.swiper-container', {
        loop: true,
        autoplay: {
            delay: 4000,
        },
        centeredSlides: false,       // prevent half cards
        spaceBetween: 30,
        breakpoints: {
            0: {
            slidesPerView: 1,
            },
            768: {
            slidesPerView: 2,
            },
            1024: {
            slidesPerView: 3,       // only 3 full cards
            },
        },
        });

      </script>

</body>
</html>