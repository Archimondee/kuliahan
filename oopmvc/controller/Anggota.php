<?php // file: oopmvc/controller/Anggota.php
class Anggota
{
    protected $model = '';

    public function __construct($model)
    {
        $this->model = $model;
    }

    public function index()
    {
        $anggota = $this->model->getAllAnggota();
        require 'view/anggota/list.php';
    }

    public function detail($id)
    {
        $anggota = $this->model->getAnggotaById($id);
        require 'view/anggota/detail.php';
    }

    public function create()
    {
        if ($_POST) {
            $this->model->insert();
            header("Location: http://localhost/oopmvc/index.php/anggota");
        } else {
            require 'view/anggota/form.php';
        }
    }

    public function edit($id)
    {
        if ($_POST) {
            $this->model->update($id);
            header("Location: http://localhost/oopmvc/index.php/anggota");
        } else {
            $anggota = $this->model->getAnggotaById($id);
            require 'view/anggota/form.php';
        }
    }

    public function delete($id)
    {
        if ($id) {
            $this->model->delete($id);
            header("Location: http://localhost/oopmvc/index.php/anggota");
        }
    }
}