<!-- view/anggota/form.php -->
<?php
$request = preg_replace("|/*(.+?)/*$|", "\\1", $_SERVER['PATH_INFO']);
$uri = explode('/', $request);

// Set form action
if ($uri[1] === 'edit') {
    $judul = 'Edit Anggota';
    $form_action = "http://localhost/oopmvc/index.php/anggota/edit?id=" . $_GET['id'];
} else {
    $judul = 'Tambah Anggota';
    $form_action = "http://localhost/oopmvc/index.php/anggota/create";
}

// Set form value
$valNama = isset($anggota['nama']) ? $anggota['nama'] : '';
$valTanggalLahir = isset($anggota['tanggal_lahir']) ? $anggota['tanggal_lahir'] : '';
$valKotaLahir = isset($anggota['kota_lahir']) ? $anggota['kota_lahir'] : '';
$valId = isset($anggota['id']) ? $anggota['id'] : '';
?>

<?php ob_start() ?>
    <h1><?= $judul ?></h1>

    <form action="<?= $form_action ?>" method="post">
        <?php if ($valId): ?>
            <input type="hidden" name="id" value="<?= $valId ?>">
        <?php endif ?>

        <div class="form-group">
            <label for="nama">Nama</label>
            <input name="nama" type="text" value="<?= $valNama ?>" class="form-control" id="nama" placeholder="Nama">
        </div>

        <div class="form-group">
            <label for="tanggal_lahir">Tanggal Lahir</label>
            <input name="tanggal_lahir" type="text" value="<?= $valTanggalLahir ?>" class="form-control" id="tanggal_lahir" placeholder="Tanggal Lahir (yyyy-mm-dd)">
        </div>

        <div class="form-group">
            <label for="kota_lahir">Kota Lahir</label>
            <input name="kota_lahir" type="text" value="<?= $valKotaLahir ?>" class="form-control" id="kota_lahir" placeholder="Kota Lahir">
        </div>

        <button class="btn btn-primary" type="submit">Simpan</button>
    </form>
<?php $isi = ob_get_clean() ?>

<?php include 'view/template.php' ?>