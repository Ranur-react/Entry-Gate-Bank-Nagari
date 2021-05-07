<link rel="stylesheet" href="<?= theme() ?>plugins/span_but/style.css">
<script src="<?= theme() ?>plugins/span_but/animated.js"></script>


<style>
	.alert-dark {
		border-color: transparent;
		background: 0 0;
		background-size: 20px 20px;
	}

	.alert-success.alert-dark {
		background-color: #78bd5d !important;
		background-image: linear-gradient(45deg, rgba(255, 255, 255, .04) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .04) 50%, rgba(255, 255, 255, .04) 75%, transparent 75%, transparent);
	}

	.alert .close {
		opacity: .4;
		color: inherit;
		text-shadow: none;
	}

	.text-muted {
		font-weight: 400;
		font-size: 12px;
	}

	.product-info.tugas {
		margin-left: 0px;
	}

	.info-warning {
		color: #fff;
		border-color: #dc9c41;
		background: #f4ab43;
	}

	.info-gagal {
		color: #fff;
		border-color: #dc451f;
		background: #eb613e;
	}
</style>
<script type="text/javascript">
	            $(document).on('click', '.btnParkirMobil', function(e) {
                $.ajax({
                    url: '<?= site_url('EntryMobil')  ?>',
                    type: "post",
                    dataType: "json",
                    cache: false,
                    beforeSend: function(response) {
						// alert("Before");
                        $('.btnParkirMobil').attr('disabled', 'disabled');
                            $('.btnParkirMobil').removeClass('btn-danger');
                            $('.btnParkirMobil').addClass('btn-success');
                        $('.btnParkirMobil').html('<i class="fa fa-spin fa-spinner"></i> Online');
                        console.log(response)

                    },
                    success: function(response) {
  						alert("Succes");
  						console.log(response);
                    },
                    complete: function() {
                      alert("Finised");
                    }
                });
            });	
</script>
<?php $urls = $this->uri->segment(2) ?>
<div class="row">
	<div class="col-md-12">
		<!-- <div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Level User Login <i class="fa fa-angle-double-right"></i> <?= $urls == null ? 'admin' : $urls ?></h3>
			</div>
			<div class="box-body">
				<a href="<?= site_url() ?>" class="btn btn-success">Admin</a>
				<a href="<?= site_url('welcome/walas') ?>" class="btn btn-info">Wali Kelas</a>
				<a href="<?= site_url('welcome/guru') ?>" class="btn btn-primary">Guru</a>
				<a href="<?= site_url('welcome/siswa') ?>" class="btn btn-danger">Siswa</a>
			</div>
		</div> -->
		<div class="alert alert-warning alert-dark m-b-1">
			<button type="button" class="close" data-dismiss="alert">×</button>
			<strong>Hei <?= user() ?></strong>, Selamat datang , Jangan lupa Aktifkan Gerbang Parkir agar pengunjung dapat memasuki area Parkir dengan semestinya	
		</div>
	</div>

	<div class="col-md-12">
		<div class="box box-success">
			<div class="box-header">
				<i class="fa fa-gear"></i>
				<h3 class="box-title">Setup Sistem</h3>
			</div>
			<div class="box-body " >
				<div class="row">
					<div class="col-md-6">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							
						</div>
						<div class="col-md-4">
							<div class="row">
								<button style="height: 200px;width: 200px;font-size: 32px;border-radius: 50%" class="btn btn-danger btnParkirMobil">
									<i class="fa  fa-power-off "></i>
								</button>
							</div>
							<div class="row">
								Parkir Mobil
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<div class="row">
								<button style="height: 200px;width: 200px;font-size: 32px;border-radius: 50%" class="btn btn-danger">
									<i class="fa  fa-power-off "></i>
								</button>
							</div>
							<div class="row">
								Parkir Mobil
							</div>
						</div>
						<div class="col-md-4">
							
						</div>
						<div class="col-md-4">
						</div>
					</div>
				</div>
		</div>
	</div>
</div>