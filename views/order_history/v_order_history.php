<div class="page-title-area">
    <div class="container">
        <div class="page-title-content">
            <h1>Lịch Sử Mua Hàng</h1>
            <ul>
                <li><a href="user.php">Trang Cá Nhân</a></li>
                <li>Lịch Sử Mua Hàng</li>
            </ul>
        </div>
    </div>
</div>


<div class="wishlist-area ptb-100">
    <div class="container">
            <div class="wishlist-table table-responsive">
                <?php if ($history != NULL): ?>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Mã đơn hàng</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Ngày đặt hàng</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($history as $key => $value): ?>
                                <tr>
                                    <td>
                                        <?php echo $key + 1; ?>
                                    </td>
                                    <td class="order-id">
                                        <?php echo $value->ma_dh; ?>
                                    </td>
                                    <td class="product-price">
                                        <?php echo number_format($value->tong_tien); ?> VNĐ
                                    </td>
                                    <td class="order_address">
                                        <?php echo $value->dia_chi; ?>
                                    </td>
                                    <td class="order_date">
                                        <?php echo $value->ngay_lap_dh; ?>
                                    </td>
                                    <td class="product-stock-status">
                                        <?php if ($value->trang_thai == 0) { ?>
                                            <span class="out-stock"><i class='bx bx-x'></i> Chờ xử lý</span>
                                        <?php } elseif ($value->trang_thai == 1) { ?>
                                            <span class="out-stock"><i class='bx bx-x'></i> Đang giao hàng</span>
                                        <?php } elseif ($value->trang_thai == 2) { ?>
                                            <span class="in-stock"><i class='bx bx-check-circle'></i> Đã nhận hàng</span>
                                        <?php } else { ?>
                                            <span class="del-stock"><i class='bx bx-x'></i> Đã hủy</span>
                                        <?php } ?>
                                    </td>
                                    <td class="d-flex">
                                        <a href="order_details.php?ma_dh=<?php echo $value->ma_dh; ?>"
                                            class="default-btn mx-2"><span>Chi Tiết</span></a>
                                        <form action="update_order.php" method="POST"> 
                                            <input type="hidden" name="trang_thai" value="3">
                                            <input type="hidden" name="ma_dh" value="<?php echo $value->ma_dh; ?>">
                                            <?php
                                            if ($value->trang_thai == 0 || $value->trang_thai == 1) {
                                                ?>
                                                <button type="submit" class="btn default-btn" style="background-color: red;" name="btn_confirm">Hủy</button>
                                                <?php
                                            }
                                            ?>
                                        </form>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <div class="user-actions">
                        <span>Bạn chưa có đơn hàng nào!! <a href="shop.php?shop">Ấn vào đây để xem sản phẩm.</a></span>
                    </div>
                <?php endif; ?>
            </div>
    </div>
</div>