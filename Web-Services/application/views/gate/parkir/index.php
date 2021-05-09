<script type="text/javascript">
	$( document ).ready(function() {
	});
		function Diall() { 
		
			var uriA=`http://admin:Hikvision!!@192.168.1.61/ISAPI/Streaming/channels/101/picture`;	
			var urlB='https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png';
			console.log(uriA);
			$(".StreamIMG").attr("src",urlB);
			$(".StreamA").attr("src",urlB);
			$(".StreamA").attr("src",uriA);
			$(".StreamIMG").attr("src",uriA);
			input_karcis();

		}

    function input_karcis() {
    	var data="&kode="+$('#input-karcis').val();
    $.ajax({
        url: '<?= site_url('cekkarcis')  ?>',
        type: "post",
        data:data,
        dataType: "json",
        cache: false,
        beforeSend: function(response) {
			// console.log(response);
        },
        success: function(response) {
			var roda="";
			$.map( response.roda, function( val, i ) {
			console.log("data: "+val.id_level+"["+i+"]");
			  roda+="<options value="+val.id_level+" >"+val.id_level+"</options>";
			});
			// $('.jenis').html()
        },
        complete: function() {
        	// alert("Complete")
        }
    });

    }




	 $(function () {
    //Initialize Select2 Elements
    $('.select2').select2() ;
})
</script>
<style type="text/css">
	.form-control{
		border-radius: 20px;
		text-align: center;
	}
	.btn{
		border-radius: 10px;
	}
</style>

<div class="row">
	<div class="col-md-12">
		<div class="box box-info">
            <div class="box-header">
              <h3 class="box-title"><i class="fa fa-credit-card"></i> Bayar Parkir</h3>
            </div>
            <div class="box-body">
			    <div class="row">
			    	<div class="col-md-12">
					    <div class="row">
					    	<!-- <div class="col-md-1"></div> -->
					    	<div class="col-md-3">
						        <div class="form-group karciskolom">
					                <label><i class="fa fa-ticket"></i> Input Kode Karcis</label>
			                            <input onchange="Diall()" oninput="Diall()" autofocus='true'  type="text" name="kode_karcis" value="" placeholder="Kode Karcis Parkir" id="input-karcis" class="form-control">
								</div>
							</div>	
							<div class="col-md-2">
						        <div class="form-group">
					                <label>No Plat </label>
			                            <input  type="text" name="noplat" value="" placeholder="BA 0000 xx" id="input-plat" class="form-control">
								</div>
							</div>
							<div class="col-md-2">
						        <div class="form-group">
					                <label>Jenis Kendaraan</label>
					                <select name="jenis" class="form-control select2 jenis" id="">
					                </select>
					                
								</div>
							</div>
							<div class="col-md-2">
						        <div class="form-group">
					                <label>Harga</label>
					                <div class="form-control">Rp.5.000</div>
								</div>
							</div>
						</div>
			    	</div>
			    </div>
            <!-- /.End Row -->
	            <div class="row">
	            	<div class="col-md-12">
	            		<div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>Foto Waktu Masuk</th>
                  <th>STREAMING</th>
                  <th>Detail Masuk</th>
                </tr>
                <tr style="font-size: 18px">
                  <td>
                		<a class="StreamA" target="blank" href="http://192.168.1.64/ISAPI/Streaming/channels/101/picture">
	                  		<img class="StreamIMG" style="  max-width: 50%;  max-height: auto;border-radius: 20px" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png">
                  		</a>
                  </td>
                  <td>
                  	<div  class="imagesStream">
                		<a class="StreamA" target="blank" href="http://192.168.1.64/ISAPI/Streaming/channels/101/picture">
	                  		<img class="StreamIMG" style="  max-width: 50%;  max-height: auto;border-radius: 20px" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png">
                  		</a>
                  	</div>
	              </td>
                  <td>
                  	Tanggal
                  	Jam
                  </td>
                </tr>
                <tr style="font-size: 24px">
                	<td colspan="2">
                		<div class="form-group">
							<label>TOTAL </label>
						</div>
                	</td>
                	<td>
						<div class="form-group">
							<label>Rp.0.000 </label>
						</div>
                	</td>
                </tr>
                <tr align="right" sty>
                	<td ></td>
                	<td ></td>
                	<td ><a class="btn btn-app btn-block" style="font-size: 18px">
			                <i class="fa fa-edit"></i> Edit
			              </a>
                	</td>
                </tr>
              </table>
            </div>
	            	</div>
	            </div>
            <!-- /.box-body -->
          </div>
	</div>
</div>