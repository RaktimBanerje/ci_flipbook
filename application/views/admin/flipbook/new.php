  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <div class="card card-default">
        <div class="card-header">
          <div class="d-inline-block">
              <h3 class="card-title"> <i class="fa fa-plus"></i>
             <?= trans('new_flipbook') ?> </h3>
          </div>
          <div class="d-inline-block float-right">
            <a href="<?= base_url('admin/flipbook/list'); ?>" class="btn btn-success"><i class="fa fa-list"></i>  <?= trans('list') ?></a>
          </div>
        </div>
        <div class="card-body">
   
           <!-- For Messages -->
            <?php $this->load->view('admin/includes/_messages.php') ?>

            <?php echo form_open(base_url('admin/flipbook/add'), 'class="form-horizontal" enctype="multipart/form-data"');  ?> 
              <div class="form-group">
                <label for="title" class="col-md-2 control-label"><?= trans('title') ?></label>

                <div class="col-md-12">
                  <input type="text" name="title" class="form-control" id="title" placeholder="">
                </div>
              </div>
              <div class="form-group">
                <label for="slug" class="col-md-2 control-label"><?= trans('slug') ?></label>

                <div class="col-md-12">
                  <input type="text" name="slug" readonly class="form-control" id="slug" placeholder="">
                </div>
              </div>

              <div class="form-group">
                <label for="logo" class="col-md-2 control-label">Logo</label>

                <div class="col-md-12">
                  <input type="file" name="logo" class="form-control">
                </div>
              </div>

              <div class="form-group">
                <label for="type" class="col-md-2 control-label">File Type</label>

                <div class="col-md-12">
                  <select name="file_type" class="form-control">
                    <option value="images">Images</option>
                    <option value="pdf">PDF</option>
                  </select>
                </div>
              </div>
              
              <div class="form-group">
                <label for="description" class="col-md-2 control-label"><?= trans('description') ?></label>

                <div class="col-md-12">
                  <textarea name="description" class="form-control" id="description" placeholder="Enter description"></textarea>
                </div>
              </div>

              <div class="form-group">
                <label for="cover_image" class="col-md-2 control-label"><?= trans('cover_image') ?></label>

                <div class="col-md-12">
                  <input type="file" name="cover_image" class="form-control" id="cover_image">
                </div>
              </div>
              <div class="form-group">
                <label for="flipbook_files" class="col-md-2 control-label"><?= trans('flipbook_files') ?></label>

                <div class="col-md-12">
                  <input type="file" name="flipbook_files[]" class="form-control" id="flipbook_files" multiple="multiple">
                </div>

                
                <div class="row">
                  
                  <div class="col-md-4">
                    <div class="form-group mt-2">
                      <label for="password" class="form-label">Disable Right Click</label>
                      
                        <select class="form-control" name="disable_right_click">
                          <option value="1">Yes</option> 
                          <option value="0">No</option> 
                        </select>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="form-group mt-2">
                      <label for="password" class="form-label">Eneble Content Sharing</label>
                      
                        <select class="form-control" name="share_content">
                          <option value="1">Yes</option> 
                          <option value="0">No</option> 
                        </select>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="form-group mt-2">
                      <label for="password" class="form-label">Collect Email</label>
                      
                        <select class="form-control" name="collect_email">
                          <option value="1">Yes</option> 
                          <option value="0">No</option> 
                        </select>
                    </div>
                  </div>
                  
                </div>
                
              </div>

                <div class="form-group mt-2">
                  <label for="password" class="col-md-2 control-label"><?= trans('password') ?></label>
                  
                  <div class="col-md-12">
                    <input type="password" name="password" class="form-control" id="password" placeholder="Keep blank for no password">
                  </div>
                </div>

                <div class="col-md-12">
                  <input type="submit" name="submit" value="<?= trans('save') ?>" class="btn btn-primary pull-right">
                </div>
              </div>
            <?php echo form_close( ); ?>
        </div>
          <!-- /.box-body -->
      </div>
    </section> 
  </div>
  <script type="text/javascript">    
    $("#title").keyup(function(){
        var txt = $(this).val();
        txt = txt.toLowerCase();
        txt = txt.replace(/[^a-zA-Z0-9]+/g,'-');
        $("#slug").val(txt);        
    });
  </script>