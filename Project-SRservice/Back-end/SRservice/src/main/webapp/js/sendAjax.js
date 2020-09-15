//submit 시 ajax 방식을 formdata upload

$("#btnSubmit").click(function (event) {

        //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
        event.preventDefault();

        // Get form
        var form = $('#fileUploadForm')[0];

	    // Create an FormData object
        var data = new FormData(form);

	   // disabled the submit button
        //$("#btnSubmit").prop("disabled", true);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "./api/fileupload",
            data: data,
            processData: false,
            contentType: false,
            success: function () {
              alert('Upload success');
              location.reload();
            },
            error: function () {
              alert('Upload error');
              location.reload();
            }
            // timeout: 600000,
            // success: function (data) {
            // 	alert("complete");
            //     $("#btnSubmit").prop("disabled", false);
            // },
            // error: function (e) {
            //     console.log("ERROR : ", e);
            //     $("#btnSubmit").prop("disabled", false);
            //     alert("fail");
            // }
        });

    });
