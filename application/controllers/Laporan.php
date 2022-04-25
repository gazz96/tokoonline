<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Laporan extends MY_Controller 
{
    public function __construct()
    {
        parent::__construct();
        
        $role = $this->session->userdata('role');

        if ($role != 'admin') {
            redirect(base_url('/'));
            return;
        }
    }

    public function index()
    {

        $tahun = $this->input->get('tahun');
        $bulan = $this->input->get('bulan');

        if( ! $tahun) $tahun = date('Y');
        
        if( ! $bulan) $bulan = date('m');

        $data['title']      = 'Admin: Laporan';
        $data['content']    = '';
        $data['page']       = 'pages/laporan/index';
        $data['total_order']     = $this->totalOrder($tahun, $bulan);

        

       

        $data['products']        = $this->getTopSelling($tahun, $bulan);

        $this->view($data);
    }

    private function totalOrder($year, $month) {
        return $this->db->select_sum('total')
            ->from('orders')
            ->where("year(date)='{$year}'")
            ->where("month(date)='{$month}'")->get()->row()->total ?? 0;
    }

    private function getTopSelling( $year, $month) {
        return $this->db->query("select title, id_product, sum(qty) as total_qty, date
        from order_detail
        join orders ON orders.id=order_detail.id_orders
        join product ON product.id = order_detail.id_product 
        WHERE year(date)='{$year}' AND month(date)='{$month}'
        group by id_product, year(date), month(date)
        order by sum(qty) desc 
        limit 10;")->result();
    }


}