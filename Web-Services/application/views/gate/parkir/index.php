<script type="text/javascript">
	$( document ).ready(function() {
	});
	function Bayar() {
					
			  fetch('http://192.168.1.10:8080', {
				method: 'POST',
				body: JSON.stringify({
					"NOTRANS":"201909100000008",
					"BIAYA":"1000"
				}),
				headers: {
					'Authorization' : 'BN OTA5',
					'Signature' : 'k4dTe4N1n/RH5YxNSPHwPSKIc8NNgkvXxmasPz2In6M=',
					'Timestamp' : '2020-12-12',
					'Procces-Type' : 'Inquery',
					'Content-Type' : 'application/x-www-form-urlencoded'
				}
			}).then(function (response) {
				console.log("Data:----");
				console.log(response);
				if (response.ok) {
					return response.json();
				}
				return Promise.reject(response);
			}).then(function (data) {
				console.log(data);
			}).catch(function (error) {
				console.warn('Something went wrong.', error);
})

			
	}
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
		function viewCaptureLoad(kode,urlstream,folderImages,date) {
			return `               
                  <td>
                		<a class="StreamA" target="blank" href="<?php echo base_url()?>`+folderImages+`/capture/`+kode+`/sc-1.jpg">
	                  		<img class="StreamIMG" style="  max-width: 50%;  max-height: auto;border-radius: 20px" src="<?php echo base_url()?>`+folderImages+`/capture/`+kode+`/sc-1.jpg">
                  		</a>
                  </td>
                  <td>
                  	<div  class="imagesStream">
                		<a class="StreamA" target="blank" href="http://admin:Hikvision!!@`+urlstream+`/ISAPI/Streaming/channels/101/picture">
	                  		<img class="StreamIMG" style="  max-width: 50%;  max-height: auto;border-radius: 20px" src="http://admin:Hikvision!!@`+urlstream+`/ISAPI/Streaming/channels/101/picture">
                  		</a>
                  	</div>
	              </td>
                  <td>
                  	`+date+`
                  </td>`;
		}
		var jenisKendaraan={};
function tampil_harga() {
	var t=$('#jenis').val();
	console.log("Val:"+t);
	console.log("Data Jenis Kendaraan:"+jenisKendaraan[t]);
	$('#harga').text(jenisKendaraan[t]);
	$('.totalharga').text(jenisKendaraan[t]);
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
        	$('.dynamicCaptureiew').html("");
        	console.log(response);
					$('.jenis').empty();
					var roda="";
			$.map( response.roda, function( val, i ) {
				jenisKendaraan[val.id_level]=val.harga;
				var newOption = new Option(val.nama, val.id_level, false, false);
				$('.jenis').append(newOption)
			});
			// console.log("Roda: "+roda)
					$('.dynamicCaptureiew').html(viewCaptureLoad(response.kode,response.urlStream,response.folderImages,response.data.date));
        },
        complete: function() {
				$('#input-plat').focus();
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
			                            <input  oninput="Diall()" autofocus='true'  type="text" name="kode_karcis" value="" placeholder="Kode Karcis Parkir" id="input-karcis" class="form-control">
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
					                <select onchange="tampil_harga()" name="jenis" class="form-control select2 jenis" id="jenis">
					                </select>
					                
								</div>
							</div>
							<div class="col-md-2">
						        <div class="form-group">
					                <label>Harga</label>
					                <div class="form-control harga" id="harga">Rp.5.000</div>
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
			                <tr class="dynamicCaptureiew" style="font-size: 18px">
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
							<label class="totalharga" id="totalharga">Rp.0.000 </label>
						</div>
                	</td>
                </tr>
                <tr align="right" sty>
                	<td ></td>
                	<td ></td>
                	<td ><a class="btn btn-app btn-block" onclick="Bayar()" style="font-size: 18px">
			                <i class="fa"></i> Bayar
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