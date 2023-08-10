<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <div class="ml-auto text-right">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Đơn hàng</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Đơn Hàng</h5>
                        <div class="table-responsive">
                            <?php if (isset($_SESSION['alert_delete_order'])): ?>
                                <div class="alert alert-success" role="alert">
                                    <?php echo $_SESSION['alert_delete_order']; ?>
                                </div>
                            <?php endif;
                            unset($_SESSION['alert_delete_order']); ?>
                            <table id="zero_config" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã đơn hàng</th>
                                        <th>Tên khách hàng</th>
                                        <th>Tổng tiền</th>
                                        <th>Phương thức thanh toán</th>
                                        <th>Trạng thái</th>
                                        <th></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <?php

                                    foreach ($list_order as $key => $value) {

                                        if ($value->phuong_thuc_thanh_toan == 0) {
                                            $phuong_thuc_thanh_toan = "Tiền mặt";
                                        } elseif ($value->phuong_thuc_thanh_toan == 1) {
                                            $phuong_thuc_thanh_toan = "Chuyển khoản";
                                        }

                                        if ($value->trang_thai == 0) {
                                            $trang_thai = "Chờ xác nhận";
                                        } else if ($value->trang_thai == 1) {
                                            $trang_thai = "Đang giao hàng";
                                        } else if ($value->trang_thai == 2) {
                                            $trang_thai = "Giao hàng thành công";
                                        }else {
                                            $trang_thai = "Đã hủy";
                                        }
                                        ?>
                                        <tr>
                                            <td>
                                                <?php echo $key; ?>
                                            </td>
                                            <td>
                                                <?php echo $value->ma_dh; ?>
                                            </td>
                                            <td>
                                                <?php echo $value->ten_khach_hang; ?>
                                            </td>
                                            <td>
                                                <?php echo $value->tong_tien; ?>
                                            </td>
                                            <td>
                                                <?php echo $phuong_thuc_thanh_toan; ?>
                                            </td>
                                            <td>
                                                <?php echo $trang_thai; ?>
                                            </td>
                                            <td>
                                                <form action="update_order.php" method="POST">
                                                    <button type="button" class="btn btn-success btn-sm"
                                                        onclick="window.location.href='order_details.php?ma_dh=<?php echo $value->ma_dh; ?>'">Chi
                                                        tiết</button>
                                                    <input type="hidden" name="trang_thai" value="1">
                                                    <input type="hidden" name="ma_dh" value="<?php echo $value->ma_dh; ?>">
                                                    <?php
                                                    if ($value->trang_thai == 0) {
                                                        ?>
                                                        <button type="submit" class="btn btn-danger btn-sm"
                                                            name="btn_confirm">Xác nhận</button>
                                                        <?php
                                                    }
                                                    ?>
                                                </form>

                                            </td>
                                        </tr>
                                    <?php } ?>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>