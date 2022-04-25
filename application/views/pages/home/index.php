<main role="main" class="container">

	<?php $this->load->view('layouts/_alert') ?>

	<div class="row">
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-12">
					<div class="card mb-3">
						<div class="card-body">
							<strong class="text-info"><?= isset($category) ? $category : 'Semua Produk' ?></strong>
							<span class="float-right">
								Urutkan harga : <a href="<?= base_url('shop/sortby/asc') ?>" class="badge badge-success">Termurah</a> | <a href="<?= base_url('shop/sortby/desc') ?>" class="badge badge-danger">Termahal</a>
							</span>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<?php foreach ($content as $row) : ?>
					<div class="col-md-4">
						<div class="card mb-3">
							<img src="<?= $row->image ? base_url("images/product/$row->image") : base_url("images/product/default.png") ?>" alt="" class="card-img-top">
							<div class="card-body">
								<h6 class="card-title"><?= $row->product_title ?></h6>
								<p class="card-text"><strong>Rp.<?= number_format($row->price, 0, ',', '.') ?>,-</strong></p>
								<p class="card-text"><?= $row->description ?></p>
								<a href="<?= base_url("shop/category/$row->category_slug") ?>" class="badge badge-secondary"><i class="fas fa-tags"></i> <?= $row->category_title ?></a>
							</div>
							<div class="card-footer">
								<form action="<?= base_url('cart/add') ?>" method="POST">
									<input type="hidden" name="id_product" value="<?= $row->id ?>">
									<div class="input-group">
										<input type="number" name="qty" value="1" class="form-control">
										<div class="input-group-append">
											<button class="btn btn-sm btn-primary" type="submit">Tambah Keranjang</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				<?php endforeach ?>
			</div>

			<nav aria-label="Page navigation example">
				<?= $pagination ?>
			</nav>
			<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
						<div class="card mb-4">
							<div class="card-footer text-center text-muted">
								@Copyright 2022 - Arif Arifudin
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
					
		<div class="col-md-3">
			<div class="row">
				<div class="col-md-12">
					<div class="card mb-3">
						<div class="card-header bg-warning text-white">
							<b>PENCARIAN</b>
						</div>
						<div class="card-body">
							<form action="<?= base_url('shop/search') ?>" method="POST">
								<div class="input-group">
									<input type="text" name="keyword" class="form-control" placeholder="Cari..." value="<?= $this->session->userdata('keyword') ?>" autocomplete="off">
									<div class="input-group-append">
										<button class="btn btn-info" type="submit">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card mb-3">
					<div class="card-header bg-warning text-white">
							<b>KATEGORI</b>
						</div>
						<ul class="list-group">
							<li class="list-group-item"><a href="<?= base_url('home') ?>">Semua Produk</a></li>
							<?php foreach (getCategories() as $category) : ?>
								<li class="list-group-item"><a href="<?= base_url("shop/category/$category->slug") ?>"><?= $category->title ?></a></li>
							<?php endforeach ?>
						</ul>						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card mb-3">
					<div class="card-header bg-warning text-white">
							<b>KONTAK KAMI</b>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><i class="fa fa-map-marker" aria-hidden="true"></i>  Jl. Wonosari – Pakis No.11, Kabupaten Klaten</li>
						<li class="list-group-item"><i class="fa fa-phone" aria-hidden="true"> </i> 085602919154 (Telp. / WA)</li>
					</ul>
					</div>
				</div>
			</div>		
		</div>
	</div>
</main>
