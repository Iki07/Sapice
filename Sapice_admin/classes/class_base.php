<?php
class Base{
    private $db;
    public function connect() {
        $this->db=mysqli_connect("localhost", "root", "", "sapice");
        if(!$this->db){
            echo "Greska pri konektovanju na bazu!<br>";
            echo mysgli_connect_errno().": ".mysqli_connect_error()."<br>";
            return false;
        }
        $this->query("SET NAMES utf8");
        return $this->db;
    }

    public function query($query) {
        return mysqli_query($this->db, $query);
    }

    public function fetch_assoc($result){
        return mysqli_fetch_assoc($result);
    }

    public function fetch_object($result){
        return mysqli_fetch_object($result);
    }

    public function error(){
        if(mysqli_error($this->db))return mysqli_errno($this->db).": ".mysqli_error($this->db);
        else return false;
    }

    public function num_rows($result){
        return mysqli_num_rows($result);
    }
    
    public function insert_id(){
        return mysqli_insert_id($this->db);
    }

    public function prepare($query) {
        return mysqli_prepare($this->db, $query);
    }

    public function close() {
        if ($this->db) {
            $closed = mysqli_close($this->db);
            if (!$closed) {
                return $this->error(); //greska ukoliko konkecija nije zatvorena
            }
            return true; //konekcija je uspesno zatvorena
        }
        return true; //konekcija nije ni bila uspostavljena, pa je prakticno "closed"
    }

}
?>