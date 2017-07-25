<?php
    class ProdukModel extends Model{
        public function __construct(){
            $this->connect();
            $this->_table = "produk";
        }
        public function showAll(){
            $query = $this->selectAll();
            $data = $this->getResult($query);
            return $data;
        }
        public function insert($data){
            $query = parent::insert($data);
            return $query;
        }
        public function show($id){
            $query = $this->selectWhere(array('id_produk'=>$id));
            $data = $this->getResult($query);
            return $data;
        }
        public function update($data, $id=''){
            $query = parent::update($data, array('id_produk'=>$id));
            return $query;
        }
        public function delete($id=''){
            $query = parent::delete(array('id_produk'=>$id));
            return $query;
        }
    }
 ?>
