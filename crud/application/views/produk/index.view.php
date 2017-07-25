<h2 class="page-header">Tampil Produk</h2>
<a class="btn btn-primary" href="<?= BASE_PATH ?>/produk/add">Tambah</a><br><br>

<table class="table table-striped table-bordered">
   <thead>
      <tr>
         <td width="25">No</td>
         <td>Nama Produk</td>
         <td>Harga</td>
         <td>Aksi</td>
      </tr>
   </thead>
   <tbody>

<?php
$no=1;
foreach($data as $d){
?>
      <tr>
         <td><?= $no ?></td>
         <td><?= $d['nama_produk'] ?> </td>
         <td><?= $d['harga'] ?></td>
         <td>

<a class="btn btn-primary" href="<?= BASE_PATH ?>/produk/edit/<?= $d['id_produk'] ?>">Edit</a>

<a class="btn btn-danger" href="<?= BASE_PATH ?>/produk/delete/<?= $d['id_produk'] ?>">Hapus</a>

         </td>
      </tr>
<?php
   $no++;
}
?>
   </tbody>
</table>
