<h2 class="page-header">Tambah Produk</h2>

<?php
//Menampilkan pesan error jika ada
if(isset($data['msg'])){
?>
<div class="alert alert-danger">
   <ul>
<?php
   foreach($data['msg'] as $error){
      echo "<li>$error</li>";
   }
?>
   </ul>
</div>
<?php
}
?>

<form class="form-horizontal" method="post" action="<?= BASE_PATH ?>/produk/insert">

<div class="form-group">
   <label class="control-label col-md-2">Nama Produk</label>
   <div class="col-md-4">
      <input type="text" name="nama" class="form-control">
   </div>
</div>

<div class="form-group">
   <label class="control-label col-md-2">Harga</label>
   <div class="col-md-4">
      <input type="number" name="harga" class="form-control">
   </div>
</div>

<button class="btn btn-primary col-md-offset-2">Simpan</button>
<a class="btn btn-warning" href="<?= BASE_PATH ?>/produk">Batal</a>

</form>
