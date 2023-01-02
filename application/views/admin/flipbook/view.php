
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!-- Flipbook -->
<link rel="stylesheet" href="<?= base_url('assets/flipbook/css/flipbook.style.css'); ?>"> 
<link rel="stylesheet" href="<?= base_url('assets/flipbook/css/font-awesome.css'); ?>"> 
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">


  <div class="container-fluid">
    <div class="row align-items-center" style="height: 70px;">
      
      <div class="col-12 col-sm-10">
        <?php if($flipbook["logo"]) { ?>
          <img src="<?php echo base_url('uploads/logo/') . $flipbook["logo"] ?>" style="height: 60px; width: 60px; margin-left: 80px; border-radius: 50%;" />  
        <?php } ?>
      </div>

      <div class="col-12 col-sm-2 text-center">
          <button class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal" onclick="edit_content()">
            <i class="fa fa-edit" style="font-size: large;"></i>
          </button>
      </div>
    
    </div>

    <div class="row">
      <div id="fp"></div>
    </div>
  </div>



  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      
      <?php echo form_open(base_url('admin/flipbook/add_page_content'), 'method="POST";' ); ?>
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">Edit Content</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
              <div class="form-group">
                <label class="form-label"></label>
                <select class="form-control" name="content_type">
                  <option value="note">Notes</option>
                  <option value="media">Video</option>
                </select> 
              </div>
              <div class="form-group">
                <label class="form-label">Enter Link</label>
                <input type="text" class="form-control d-none" name="flipbook_id" value="<?php echo $flipbook["id"] ?>">
                <input type="text" class="form-control d-none" name="page" value="" id="page">
                <input type="text" class="form-control d-none" name="link" value="" id="link">
              </div>
              <div class="form-group">
                <label class="form-label">Content</label>
                <textarea class="form-control" name="content"></textarea>
              </div>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="submit" class="btn btn-dark">Save</button>
          </div>
        </div>
      <?php echo form_close(); ?>
    </div>
  </div>

  
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  <script src="<?= base_url()?>assets/plugins/jquery/jquery.min.js"></script>
  <script src="<?= base_url('assets/flipbook/js/flipbook.min.js'); ?>"></script>



  <script type="text/javascript">  
  $(document).ready(function () {
    var pages = [];

    <?php foreach($flipbook["pages"] as $page) { ?>
      pages[<?php echo $page["page"] ?>-1] = {
        <?php if($page["content_type"]=="note") { ?>
          htmlContent: '<div border border-dark" style="height: 300px; width: 250px; background-color: #feff87; border-radius: 10px;"><p><?php echo $page["content"]?></p></div>' 
        <?php } ?>    

        <?php if($page["content_type"]=="media") { ?>
          htmlContent: '<iframe  width="640" height="360" src="<?php echo $page["content"] ?>" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>' 
        <?php } ?>    
      }
    <?php } ?>
 
    // pages[1] = {
    //   htmlContent:'<p>Some text</p><div style="position:absolute;top:100px;left:200px;">div with custom css</div>'
    // };
    
    // pages[2] = {
    //   htmlContent:'<iframe width="640" height="360" src="https://www.youtube.com/embed/KDP0dCZ6M68" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'
    // };

    $("#fp").flipBook({
        <?php
        $l = sizeof($flipbook['files']);
        $file =  $flipbook['files'][0]['file'];
        $check_ext = strtolower(pathinfo($file,PATHINFO_EXTENSION));
        if($l == 1 and strtolower($check_ext) == "pdf"){
        ?>
        pdfUrl:"<?php echo base_url($file); ?>",
        pages:pages,
      <?php }
      else{?>
        pages:[
          <?php foreach($flipbook['files'] as $file){?>
            {src:"<?php echo base_url($file['file']); ?>", thumb:"<?php echo base_url($file['thumbs']); ?>", title:"<?php echo $file['title']; ?>"},
          <?php }?>
        ],
      <?php }?>
        /*viewMode:"3d",
        layout:2*/
        lightBoxFullscreen: false,
        template:{
            sounds: {
                startFlip: 'assets/flipbook/mp3/turnPage.mp3',
                endFlip: 'assets/flipbook/mp3/turnPage.mp3'
              }
        },
        btnShare: {
          enabled: <?php echo $flipbook["share_content"] ?>,
          title: "Share",
          icon: "fa-link"
        },
        btnSearch: {
          enabled: true,
          title: "Search",
          icon: "fas fa-search",
          icon2: "search"
        },
        deeplinkingPrefix: "page"

    });

    if(<?php echo $flipbook["disable_right_click"] ?>) {
      $(document).bind("contextmenu",function(e){
      return false;
    });
    }

  });
  </script>

    <script>
      setTimeout(() => {
        document.querySelectorAll(".flipbook-main-wrapper")[0].style.top = "70px";        
      }, 1000);

      function edit_content() {
        const deeplink = window.location.href.split("#page")
        $("#link").val(window.location.href)
        $("#page").val(deeplink[1])
      }
    </script>