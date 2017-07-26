<?php
class ProdukModel extends Model{
   public function __construct(){
      $this->connect();
      $this->_table = "produk";		
   }
}
