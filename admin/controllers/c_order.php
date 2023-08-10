<?php
include_once("../admin/models/m_order.php");
@session_start();
class c_order
{

    public function order()
    {

        $m_order = new m_order();
        $list_order = $m_order->select_order();

        $view = "views/order/v_order.php";
        include_once "templates/layout.php";
    }

    public function delete_order()
    {
        if (isset($_GET['ma_dh'])) {
            $ma_dh = $_GET['ma_dh'];

            $m_order = new m_order();
            $delete = $m_order->delete_order_by_id($ma_dh);

            $delete_details = $m_order->delete_order_details_by_id($ma_dh);
            if ($delete && $delete_details) {
                $_SESSION['alert_delete_order'] = "Xóa thành công đơn hàng số " . $ma_dh;
                echo "<script> window.location.href='order.php'</script>";
            }
        }
    }

    public function order_details()
    {
        if (isset($_GET['ma_dh'])) {
            $ma_dh = $_GET['ma_dh'];

            $m_order = new m_order();
            $details  = $m_order->select_order_details($ma_dh);

            $view = "views/order/v_order_details.php";
            include_once "templates/layout.php";
        }
    }

    public function update_status()
    {
        if (isset($_POST['ma_dh'])) {
            $ma_dh = $_POST['ma_dh'];
            $m_order = new m_order();
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
    
                // Thực hiện cập nhật trạng thái đơn hàng
                $m_order = new m_order();
                $update = $m_order->update_status_order($ma_dh, $trang_thai);
    
                if ($update) {
                    $_SESSION['alert_update'] = "Xác nhận đơn hàng " . $ma_dh . " thành công!";
                    echo "<script> window.location.href='order.php'</script>";
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