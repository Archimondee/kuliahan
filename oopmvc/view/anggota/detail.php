<!-- view/anggota/detail.php -->
<?php $judul = $anggota['nama'] ?>

<?php ob_start() ?>
    <h1><?= $anggota['nama'] ?></h1>

    <dl>
        <dt>Nama : </dt>
        <dd><?= $anggota['nama'] ?></dd>
        <dt>Tanggal Lahir : </dt>
        <dd><?= $anggota['tanggal_lahir'] ?></dd>
        <dt>Kota Lahir : </dt>
        <dd><?= $anggota['kota_lahir'] ?></dd>
    </dl>
<?php $isi = ob_get_clean() ?>

<?php include 'view/template.php' ?>