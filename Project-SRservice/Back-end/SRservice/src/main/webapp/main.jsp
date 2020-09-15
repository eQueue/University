<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Get Super Resolution</title>
    <!-- <link rel="shortcut icon" type="image⁄x-icon" href="location"> -->

    <link href="./css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

  </head>
  <body>
    <div class="container py-5">

      <!-- For demo purpose -->
      <header class="text-white text-center">
          <h1 class="display-4">Bootstrap image upload</h1>
          <p class="lead mb-0">Build a simple image upload button using Bootstrap 4.</p>
          <p class="mb-5 font-weight-light">Snippet by
              <a href="https://bootstrapious.com" class="text-white">
                  <u>Bootstrapious</u>
              </a>
          </p>
          <img src="https://res.cloudinary.com/mhmd/image/upload/v1564991372/image_pxlho1.svg" alt="" width="150" class="mb-4">
      </header>


      <div class="row py-4">
          <div class="col-lg-6 mx-auto">

              <!-- Upload image input-->

                <form id="fileUploadForm" enctype="multipart/form-data">
                  <div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm">
                  <input id="upload" type="file" name="file" accept="image/*" onchange="readURL(this);" >
                  <label id="upload-label" for="upload" class="font-weight-light text-muted">Choose file</label>
                  </div>
                  <div class="input-group mb-3 px-2 py-2 rounded-pill bg-white ">
                  <input id="email" type="email" name="email" class="font-weight-light text-muted" value="Insert email">
				  </div>
                  <i id="btn-send" class="fa fa-cloud-upload mr-2 text-muted"><input id="btnSubmit" type="submit" value="SEND" class="btn btn-light m-0 rounded-pill"></i>

                </form>

                <br>
                <br>
              <!-- Uploaded image area-->
              <p class="font-italic text-white text-center">The image uploaded will be rendered inside the box below.</p>
              <div class="image-area mt-4"><img id="imageResult" src="#" alt="" class="img-fluid rounded shadow-sm mx-auto d-block"></div>

          </div>
      </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="./js/showfile.js" type="text/javascript"></script>
    <script src="./js/sendAjax.js" type="text/javascript"></script>
  </body>
</html>
