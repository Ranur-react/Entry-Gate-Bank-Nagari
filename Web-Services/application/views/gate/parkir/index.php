<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/hmac-sha256.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/enc-base64.min.js"></script>
<script type="text/javascript">
// Global Variabel
		var database={};



	$( document ).ready(function() {
$('#input-karcis').on('keypress',function(e) {
    if(e.which == 13) {
        Diall()
    }
});
$('#input-plat').on('keypress',function(e) {
    if(e.which == 13) {
        $('#keterangan').focus();
    }
});
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
	database['jenis']=$('#jenis').val();
	database['harga']=jenisKendaraan[t];
	console.log("Val:"+t);
	console.log("Data Jenis Kendaraan:"+jenisKendaraan[t]);
	$('#harga').text(convertToRupiah(jenisKendaraan[t]));
	$('.totalharga').text(convertToRupiah(jenisKendaraan[t]));
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
        	// console.log("Cari Status");
        	console.log(response);
			$('.jenis').empty();

        	if (response.status==true) {
				var roda="";
				$.map( response.roda, function( val, i ) {
					jenisKendaraan[val.id_level]=val.harga;
					var newOption = new Option(val.nama, val.id_level, false, false);
					$('.jenis').append(newOption)
				});
						// console.log("Roda: "+roda)
				$('.dynamicCaptureiew').html(viewCaptureLoad(response.kode,response.urlStream,response.folderImages,response.data.date));
				$('#input-plat').focus();
        		console.log("Kondisi True ----")
        		database['idkarcis']=$('#input-karcis').val();
        		database['Timestamp']="<?= date('Y-m-d') ?>";
        		tampil_harga();
        	}else{
				$('#input-karcis').focus();
        		console.log("Data Empety")
        		database['idkarcis']=null;
        		database['noplat']=null;
        		database['jenis']=null;
        		database['harga']=null;
        		database['keterangan']=null;
        		database['Timestamp']=null;


        	}
        },
        complete: function() {
				// $('#input-plat').focus();
	        	// alert("Complete")
        }
    });

    }

function convertToRupiah(angka)
{
	var rupiah = '';		
	var angkarev = angka.toString().split('').reverse().join('');
	for(var i = 0; i < angkarev.length; i++) if(i%3 == 0) rupiah += angkarev.substr(i,3)+'.';
	return 'Rp. '+rupiah.split('',rupiah.length-1).reverse().join('');
}
function noplatInput() {
	database['noplat']=$('#input-plat').val();
	console.log("No Plat:")
	console.log(database.noplat)
}
function inputketerangan() {
	database['keterangan']=$('#keterangan').val();
}
function Tunai() {

	console.log("Data-----:")
	console.log(database)
}
function qris_api() {
	var NOTRANS=database.idkarcis;
	var BIAYA=database.harga;
	var Timestamp=database.Timestamp;
	var body="{NOTRANS:"+NOTRANS+",BIAYA:"+BIAYA+"}";

var hash = CryptoJS.HmacSHA256(body+":"+Timestamp, "BIM%B4nd4r4111111==");
  var hashInBase64 = CryptoJS.enc.Base64.stringify(hash);
  console.log(hashInBase64);
  // document.write(hashInBase64);
		database['signature']="hashInBase64";
		$.ajax({
			type: "post",
			url: "<?= site_url('qrisapi') ?>",
			data: {myData: JSON.stringify(database)},
			cache: false,
			success: function(response) {
				$('#LoadingQris').html(response);
				$('#modal-Qris-waiting').modal('show');
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

	.btn-sumbit{
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		/*padding-bottom: 5px;*/
		/*padding-top: 5px;*/
	}
	.btn-icon{
		/*background-color: yellowx	;*/
		width: 50%;
		height: 100%;
		display: flex;
		flex-direction: row;
		/*margin-bottom: -10%;*/
		/*margin-top: 10px;*/
		padding-top: -10px;
	}
	.btn-lable{
		/*background-color: grey;*/
		width: 50%;
		height: 100%;
		text-align: right;

	}
		.tombolIcon{
			width: auto;height: 100%;
			margin-right: 10%;
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
			                            <input  oninput="//Diall()" autofocus='true'  type="text" name="kode_karcis" value="" placeholder="Kode Karcis Parkir" id="input-karcis" class="form-control">
								</div>
							</div>	
							<div class="col-md-2">
						        <div class="form-group">
					                <label>No Plat </label>
			                            <input  type="text" oninput="noplatInput()" name="noplat" value="" placeholder="BA 0000 xx" id="input-plat" class="form-control">
								</div>
							</div>
							<div class="col-md-4">
						        <div class="form-group">
					                <label>Jenis Kendaraan</label>
					                <select onchange="tampil_harga()"  name="jenis" class="form-control select2 jenis" id="jenis">
					                </select>
					                
								</div>
							</div>
							<div class="col-md-2">
						        <div class="form-group">
					                <label>Harga</label>
					                <div class="form-control harga" id="harga">Rp.0.000</div>
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
                <tr align="left" sty>
                	<td >
				        <div class="form-group">
			                <label>Keterangan Kendaraan</label>
			                <textarea oninput="inputketerangan()" placeholder="Kendaraan lebih dari 1 hari" class="form-control " id="keterangan"></textarea>
						</div>
                	</td>
                	<td colspan="2" >
                		<a class="btn btn-app btn-block btn-sumbit" onclick="qris_api()" style="font-size: 18px">
                			<div class="btn-lable">Bayar Dengan</div>
                			<div class="btn-icon">
                				<img src="<?= theme() ?>images/qris.png" class="tombolIcon"	 alt="">
                			</div>
  
		              </a>
                  		<a class="btn btn-app btn-block" onclick="Tunai()" style="font-size: 18px">
			                <i class="fa"></i> Bayar Tunai
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
<div  id="LoadingQris"></div>