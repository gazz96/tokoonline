<script>
window.onload = function () {


let dataPoints = [
    <?php foreach($products as $product) : ?>
    {
        y: <?php echo $product->total_qty ?>,
        label: "<?php echo $product->title ?>"
    },
    <?php endforeach; ?>
];
<?php foreach($products as $product) : ?>
    temp = {
        y: "<?php echo $product->total_qty; ?>",
        label: "<?php echo $product->title; ?>"
    }
    dataPoints.push(temp);
<?php endforeach; ?>

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	title:{
		text: "Pendapatan <?php if($this->input->get('tahun')) echo $this->input->get('tahun');  ?><?php if($this->input->get('bulan')) echo "-" . $this->input->get('bulan');  ?> Rp. <?php echo number_format($total_order) ?>"
	},
	axisY: {
		title: "Pendapatan"
	},
	data: [{        
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Kategori Produk",
		dataPoints: dataPoints
	}]
});
chart.render();


}
</script>
<main role="main" class="container">

    <div class="row">
        <div class="col-md-10 mx-auto">
            <?php $this->load->view('layouts/_alert') ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-10 mx-auto">
            <div class="card">
                <div class="card-header bg-warning">
                    <span>Laporan</span>

                        
                </div>
                <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="i-tahun">Tahun</label>
                                        <input name="tahun" type="number" value="<?php echo $this->input->get('tahun') ?? date('Y') ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="i-bulan">Bulan</label>
                                        <select name="bulan" id="i-bulan" class="form-control">
                                            <option value="1" <?php if($this->input->get('bulan') ?? date('m') == 1) echo "selected"; ?>>Januari</option>
                                            <option value="2"  <?php if($this->input->get('bulan')?? date('m') == 2) echo "selected"; ?>>Februari</option>
                                            <option value="3"  <?php if($this->input->get('bulan')?? date('m') == 3) echo "selected"; ?>>Maret</option>
                                            <option value="4"  <?php if($this->input->get('bulan')?? date('m') == 4) echo "selected"; ?>>April</option>
                                            <option value="5"  <?php if($this->input->get('bulan')?? date('m') == 5) echo "selected"; ?>>Mei</option>
                                            <option value="6"  <?php if($this->input->get('bulan')?? date('m') == 6) echo "selected"; ?>>Juni</option>
                                            <option value="7"  <?php if($this->input->get('bulan')?? date('m') == 7) echo "selected"; ?>>Juli</option>
                                            <option value="8"  <?php if($this->input->get('bulan')?? date('m') == 8) echo "selected"; ?>>Agustus</option>
                                            <option value="9"  <?php if($this->input->get('bulan')?? date('m') == 9) echo "selected"; ?>>September</option>
                                            <option value="10"  <?php if($this->input->get('bulan')?? date('m') == 10) echo "selected"; ?>>Oktober</option>
                                            <option value="11"  <?php if($this->input->get('bulan')?? date('m') == 11) echo "selected"; ?>>November</option>
                                            <option value="12"  <?php if($this->input->get('bulan')?? date('m') == 12) echo "selected"; ?>>Desember</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-primary">Apply</button>
                        </form>
                    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                </div>
            </div>
        </div>
    </div>
</main>

