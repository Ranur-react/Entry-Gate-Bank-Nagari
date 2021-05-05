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
		<div class="alert alert-success alert-dark m-b-1">
			<button type="button" class="close" data-dismiss="alert">×</button>
			<strong>Hei <?= user() ?></strong>, selamat datang kembali.
		</div>
	</div>

	<div class="col-md-4">
		<div class="box box-success">
			<div class="box-header">
				<i class="fa fa-comments-o"></i>
				<h3 class="box-title">Pesan</h3>
			</div>
			<div class="box-body chat" id="chat-box">
				<div class="item">
					<img src="<?= theme() ?>dist/img/user4-128x128.jpg" alt="user image" class="online">

					<p class="message">
						<a href="#" class="name">
							<small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 2:15</small>
							Mike Doe
						</a>
						I would like to meet you to discuss the latest news...
					</p>
				</div>
				<div class="item">
					<img src="<?= theme() ?>dist/img/user3-128x128.jpg" alt="user image" class="offline">
					<p class="message">
						<a href="#" class="name">
							<small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:15</small>
		 					Alexander Pierce
						</a>
						I would like to meet you to discuss the latest news..
					</p>
				</div>
				<div class="item">
					<img src="<?= theme() ?>dist/img/user2-160x160.jpg" alt="user image" class="offline">
					<p class="message">
						<a href="#" class="name">
							<small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:30</small>
							Susan Doe
						</a>
						I would like to meet you to discuss the latest news...
					</p>
				</div>
			</div>
			<div class="box-footer text-center">
				<a href="javascript:void(0)" class="uppercase">Tampilkan semua pesan...</a>
			</div>
		</div>
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Quis dan Ujian</h3>
			</div>
			<div class="box-body">
				<ul class="products-list product-list-in-box">
					<li class="item">
						<div class="product-info tugas">
							<a href="javascript:void(0)" class="product-title">Mapel 1
								<span class="text-muted pull-right">Tgl Ujian: 01-01-2020</span>
							</a>
							<span class="product-description">Kelas: X | Guru: Guru 1
								<span class="label label-success pull-right">Belum Ujian</span>
							</span>
							<a href="">
							</a>
						</div>
					</li>
					<li class="item">
						<div class="product-info tugas">
							<a href="javascript:void(0)" class="product-title">Mapel 2
								<span class="text-muted pull-right">Tgl Ujian: 01-01-2020</span>
							</a>
							<span class="product-description">Kelas: X | Guru: Guru 2
								<span class="label label-warning pull-right">Belum Dinilai</span>
							</span>
							<a href="">
							</a>
						</div>
					</li>
					<li class="item">
						<div class="product-info tugas">
							<a href="javascript:void(0)" class="product-title">Mapel 3
								<span class="text-muted pull-right">Tgl Ujian: 01-01-2020</span>
							</a>
							<span class="product-description">Kelas: X | Guru: Guru 3
								<span class="label label-primary pull-right">Sudah Dinilai</span>
							</span>
							<a href="">
							</a>
						</div>
					</li>
					<li class="item">
						<div class="product-info tugas">
							<a href="javascript:void(0)" class="product-title">Mapel 4
								<span class="text-muted pull-right">Tgl Ujian: 01-01-2020</span>
							</a>
							<span class="product-description">Kelas: X | Guru: Guru 4
								<span class="label label-danger pull-right">Tidak Ikut Ujian</span>
							</span>
							<a href="">
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="box-footer text-center">
				<a href="javascript:void(0)" class="uppercase">Tampilkan semua tugas...</a>
			</div>
		</div>
	</div>
</div>