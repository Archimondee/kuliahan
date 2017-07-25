<?php
    use \application\controllers\MainController;
    class ProdukController extends MainController{
        function __construct(){
            $this->model('produk');
        }
        public function index(){
            $data = $this->produk->showAll();
            $this->template('produk/index', $data);
        }
        public function add(){
            $this->template('produk/add');
        }
        public function insert(){
            $error = array();
            $data = array();
            $data['nama_produk'] = $_POST['nama'];
            $data['harga'] = $_POST['harga'];
            if(empty($data['nama_produk'])) array_push($error, "Nama belum di isi");
            if(empty($data['harga'])) array_push($error, 'Harga belum di isi');
            if(count($error)==0){
                $simpan = $this->produk->insert($data);
                if($simpan) $this->redirect('produk');
            }else{
                $this->template('produk/add', array('msg'=>$error));
            }
        }
        public function edit($id){
            $data = $this->produk->show($id);
            $this->template('produk/edit', $data);
        }
        public function update(){
            $error = array();
            $data = array();
            $data['nama_produk'] = $_POST['nama_produk'];
            $data['harga'] = $_POST['harga'];
            $id = $_POST['id'];
            if(empty($data['nama_produk'])) array_push($error, "Nama belum di isi");
            if(empty($data['harga'])) array_push($error, 'Harga belum di isi');
            if(count($error)==0){
                $simpan = $this->produk->update($data, $id);
                if($simpan) $this->redirect('produk');
            }else{
                $data = $this->produk->show($id);
                $this->template('produk/edit', array('msg'=>$error, 'data'=>$data));
            }
        }
        public function delete($id){
            $hapus = $this->produk->delete($id);
            if($hapus) $this->redirect('produk');
        }
    }
 ?>
