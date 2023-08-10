<?php
include ("models/m_checkout.php");
@session_start();
class c_order_history {
    public function order_history() {

        $ma_kh = $_SESSION['id_user'];

        $m_checkout = new m_checkout();

        $history = $m_checkout->select_order_history($ma_kh);

        $view = "views/order_history/v_order_history.php";
        include ("templates/layout.php");
    }

    public function order_details() {

        if(isset($_GET['ma_dh'])) {
            $ma_dh = $_GET['ma_dh'];

            $m_checkout = new m_checkout();
            $details = $m_checkout->select_order_details($ma_dh);

            $view = "views/order_history/v_order_details.php";
            include("templates/layout.php");
        }
    }

    public function update_status()
    {
        if (isset($_POST['ma_dh'])) {
            $ma_dh = $_POST['ma_dh'];
            $m_order = new m_checkout();
            $status = $m_order->select_status($ma_dh);
    
            // Kiểm tra nếu người dùng đã nhấn nút "Xác nhận"
            if (isset($_POST['btn_confirm'])) {
                // Kiểm tra xem giá trị $_POST['trang_thai'] có tồn tại hay không
                if (isset($_POST['trang_thai'])) {
                    $trang_thai = $_POST['trang_thai'];
                } else {
                    // Nếu không tồn tại, gán giá trị mặc định là 1
                    $trang_thai = 0;
                }
     
                $update = $m_order->update_status_order($ma_dh, $trang_thai);
    
                if ($update) {
                    $_SESSION['alert_update'] = "Xác nhận đơn hàng " . $ma_dh . " thành công!";
                    echo "<script> window.location.href='order_history.php'</script>";
                    exit; // Thêm exit để chắc chắn dừng xử lý và chuyển hướng trang ngay sau khi cập nhật thành công.
                } else {
                    echo "Cập nhật trạng thái đơn hàng thất bại!";
                }
            }
        } else {
            echo "Không có mã đơn hàng được truyền vào.";
            echo "<script> window.location.href='order.php'</script>";
        }
    
        // $view = "views/order/v_order.php";
        // include_once "templates/layout.php";
    }
}
?>