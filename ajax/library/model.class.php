<?php
class Model{
	protected $_dbHandle;
	protected $_table;
	
//Koneksi ke database	
	public function connect(){
		$this->_dbHandle = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
		
		if(mysqli_connect_errno()){
			echo "Failed to connect database: ".mysqli_connect_error();
		}
	}

//Method untuk memproses hasil query	
	public function query($query){
		return mysqli_query($this->_dbHandle, $query);
	}
	
	public function getResult($mysqliQuery){
		$data = array();
		while($record = mysqli_fetch_array($mysqliQuery)){
			array_push($data, $record);
		}
		return $data;
	}
	
	public function getRows($mysqliQuery){
		return mysqli_num_rows($mysqliQuery);
	}
	
	public function getError(){
		return mysqli_error($this->_dbHandle);
	}
	
	public function getId(){
		return mysqli_insert_id($this->_dbHandle);
	}
	
//Method untuk menampilkan data		
	public function selectAll($orderBy='', $order='ASC', $limit=''){
		$query = "SELECT * FROM ".$this->_table;
		
		if($orderBy!='') $query .= " ORDER BY $orderBy $order";
		if($limit!='') $query .= " LIMIT $limit";
		
		return $this->query($query);
	}
	
	public function selectWhere($condition='', $orderBy='', $order='ASC', $limit=''){
		$query = "SELECT * FROM ".$this->_table;
		
		if(is_array($condition)){
			$query .= " WHERE";
			foreach($condition as $key=>$val){
				$query .= " $key='$val' AND";
			}
			$query = substr($query, 0, -3);
		}
		
		if($orderBy!='') $query .= " ORDER BY $orderBy $order";
		if($limit!='') $query .= " LIMIT $limit";
		
		return $this->query($query);
	}
	
	public function selectLike($condition='', $orderBy='', $order='ASC', $limit=''){
		$query = "SELECT * FROM ".$this->_table;
		
		if(is_array($condition)){
			$query .= " WHERE";
			foreach($condition as $key=>$val){
				$query .= " $key LIKE '$val' OR";
			}
			$query = substr($query, 0, -2);
		}
		
		if($orderBy!='') $query .= " ORDER BY $orderBy $order";
		if($limit!='') $query .= " LIMIT $limit";
		
		return $this->query($query);
	}
	
	public function selectJoin($table, $join="JOIN", $param, $condition='', $orderBy='', $order='ASC', $limit=''){
		$query = "SELECT * FROM ".$this->_table;
		
		if(is_array($table)){
			foreach($table as $tbl){
				$query .= " $join $tbl";
			}
		}else $query .= " $join $table";
		
		foreach($param as $key=>$val){
			$query .= " ON $key=$val";
		}
			
		if(is_array($condition)){
			$query .= " WHERE";
			foreach($condition as $key=>$val){
				$query .= " $key='$val' AND";
			}
			$query = substr($query, 0, -3);
		}
		
		if($orderBy!='') $query .= " ORDER BY $orderBy $order";
		if($limit!='') $query .= " LIMIT $limit";
		
		return $this->query($query);
	}

//Method untuk menghapus data	
	public function delete($condition=''){
		$query = "DELETE FROM ".$this->_table;
		
		if(is_array($condition)){
			$query .= " WHERE";
			foreach($condition as $key=>$val){
				$query .= " $key='$val' AND";
			}
			$query = substr($query, 0, -3);
		}
		
		return $this->query($query);
	}
	
//Method untuk menambah data		
	public function insert($data){
		$query = "INSERT INTO ".$this->_table." SET";
		
		foreach($data as $key=>$val){
			$query .= " $key='$val',";
		}
		$query = substr($query, 0, -1);
		
		return $this->query($query);
	}
	
//Method untuk memperbaiki data		
	public function update($data, $condition=''){
		$query = "UPDATE ".$this->_table." SET";
		
		foreach($data as $key=>$val){
			$query .= " $key='$val',";
		}
		$query = substr($query, 0, -1);
		
		if(is_array($condition)){
			$query .= " WHERE";
			foreach($condition as $key=>$val){
				$query .= " $key='$val' AND";
			}
			$query = substr($query, 0, -3);
		}
		
		return $this->query($query);
	}
}