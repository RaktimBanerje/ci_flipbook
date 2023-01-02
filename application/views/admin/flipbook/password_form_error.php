<!DOCTYPE html>
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width" />
      <title>Password Protected</title>
      <link rel="stylesheet" href="<?= base_url()?>assets/front/css/components.css">
      <link rel="stylesheet" href="<?= base_url()?>assets/front/css/responsee.css">
      <link rel="stylesheet" href="<?= base_url()?>assets/front/owl-carousel/owl.carousel.css">
      <link rel="stylesheet" href="<?= base_url()?>assets/front/owl-carousel/owl.theme.css">
      <!-- CUSTOM STYLE -->
      <link rel="stylesheet" href="<?= base_url()?>assets/front/css/template-style.css">
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
      <script type="text/javascript" src="<?= base_url()?>assets/front/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="<?= base_url()?>assets/front/js/jquery-ui.min.js"></script>    
      <script type="text/javascript" src="<?= base_url()?>assets/front/js/modernizr.js"></script>
      <script type="text/javascript" src="<?= base_url()?>assets/front/js/responsee.js"></script>
      <script type="text/javascript" src="<?= base_url()?>assets/front/js/template-scripts.js"></script> 
                 
      <!--[if lt IE 9]>
	      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
      <![endif]-->
   </head>
   <body class="size-1140">
      <!-- TOP NAV WITH LOGO -->
      <header>
         <div id="topbar">
            <div class="line">
               <div class="s-12 m-6 l-6">
                  
               </div>
               <div class="s-12 m-6 l-6">

               </div>
            </div>  
         </div> 
         <nav>
            <div class="line">
               <div class="s-12 l-2">
                  <p class="logo"><strong>Flip</strong>Book</p>
               </div>
               <div class="top-nav s-12 l-10">
                  <p class="nav-text">Custom menu text</p>
                  <ul class="right">
                     <li class="active-item"><a href="#carousel">Home</a></li>
                     <li><a href="#features">Features</a></li>
                     <li><a href="#about-us">About Us</a></li>
                     <li><a href="#books">Books</a></li>
                     <li><a href="#services">Services</a></li>
                     <li><a href="#contact">Contact</a></li>
                  </ul>
               </div>
            </div>
         </nav>
      </header>  
      <section>
        

         <!-- CONTACT -->
         <div id="contact">
            <div class="line">
               <h2 class="section-title"></h2>
               <div class="margin">
                  <div class="s-12 m-12 l-4 hide-m hide-s margin-bottom right-align">
                    
                  </div>
                 
                  <div class="s-12 m-12 l-4">
                    <h2>Enter Password</h2>
                    <h6 class="mb-4" style="color: red;">You have enter wrong password</h6>
                    <p><?php $this->load->view('admin/includes/_messages.php') ?></p>
                    
                    <?php echo form_open(base_url('admin/flipbook/password_check'), 'method="POST"; class="customform" ' ); ?>
                        <div class="s-12">
                            <input class="form-control" name="id" type="text" value="<?php echo $flipbook["id"] ?>" style="display: none;" />
                        </div>
                        <div class="s-12">
                            <input class="form-control" name="password" type="password" require  />
                        </div>
                      <div class="s-12 m-12 l-4">
                        <input type="submit" value="Submit" name="submit" style="width: max-content;" class="color-btn form-control">
                      </div>
                    <?php echo form_close(); ?>
                  </div>  
                   <div class="s-12 m-12 l-4 margin-bottom right-align">
                  </div>              
               </div>
            </div>
         </div>
      </section>
      <!-- FOOTER -->
      <footer>
         <div class="line">
            <div class="s-12 l-6">
               <p>Copyright <?php echo date('Y')?></p>
               <p>All images is purchased from Bigstock. Do not use the images in your website.</p>
            </div>
            <div class="s-12 l-6">
               <a class="right" href="http://www.myresponsee.com" title="Responsee - lightweight responsive framework">Design and coding<br> by Responsee Team</a>
            </div>
         </div>
      </footer>
      <script type="text/javascript" src="<?= base_url()?>assets/front/owl-carousel/owl.carousel.js"></script>
      <script type="text/javascript">
         jQuery(document).ready(function($) {
            var theme_slider = $("#owl-demo");
            $("#owl-demo").owlCarousel({
                navigation: false,
                slideSpeed: 300,
                paginationSpeed: 400,
                autoPlay: 6000,
                addClassActive: true,
             // transitionStyle: "fade",
                singleItem: true
            });
            $("#owl-demo2").owlCarousel({
                slideSpeed: 300,
                autoPlay: true,
                navigation: true,
                navigationText: ["&#xf007","&#xf006"],
                pagination: false,
                singleItem: true
            });
        
            // Custom Navigation Events
            $(".next-arrow").click(function() {
                theme_slider.trigger('owl.next');
            })
            $(".prev-arrow").click(function() {
                theme_slider.trigger('owl.prev');
            })     
        }); 
      </script>
   </body>
</html>