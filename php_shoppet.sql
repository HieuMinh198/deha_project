-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 17, 2023 lúc 04:32 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `php_shoppet`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `anh_sp`
--

CREATE TABLE `anh_sp` (
  `id` int(11) NOT NULL,
  `id_sp` varchar(11) DEFAULT NULL,
  `hinh_anh` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `anh_sp`
--

INSERT INTO `anh_sp` (`id`, `id_sp`, `hinh_anh`) VALUES
(12, '0', '356297414_620688303374671_9082715784514874991_n.jpg'),
(13, '0', '356299098_842928936879505_9084971767962685768_n.jpg'),
(21, 'SPDM1', 'Chu-cho-Anuko-noi-tieng-tren-mang-xa-hoi.jpg'),
(22, 'SPDM1', 'hinh-anh-cho-cuoi-deu-14.jpg'),
(23, 'SPDM1', 'anh-cho-cuoi.jpg'),
(24, 'SPDM1', 'Hinh-anh-cho-ngau.jpg'),
(25, 'SPDM2', 'image-222-hinh-anh-cho-ngao-hai-huoc-doc-nhat-hien-nay-2023-167991005026339.jpg'),
(26, 'SPDM2', 'Chu-cho-Anuko-noi-tieng-tren-mang-xa-hoi.jpg'),
(27, 'SPDM2', 'hinh-anh-cho-cuoi-deu-14.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ct_don_hang`
--

CREATE TABLE `ct_don_hang` (
  `ma_dh` int(11) NOT NULL,
  `ma_sp` varchar(11) NOT NULL,
  `so_luong` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ct_don_hang`
--

INSERT INTO `ct_don_hang` (`ma_dh`, `ma_sp`, `so_luong`) VALUES
(31, 'Demo1', 5),
(32, 'SPDM1', 5),
(33, 'SPDM2', 100);

--
-- Bẫy `ct_don_hang`
--
DELIMITER $$
CREATE TRIGGER `insert_don_hang` BEFORE INSERT ON `ct_don_hang` FOR EACH ROW begin
 UPDATE san_pham
 SET so_luong = so_luong - NEW.so_luong
 where ma_sp = NEW.ma_sp;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `ma_dh` int(11) NOT NULL,
  `ma_kh` int(11) NOT NULL,
  `tong_tien` int(10) NOT NULL,
  `phuong_thuc_thanh_toan` varchar(255) NOT NULL,
  `ngay_lap_dh` date NOT NULL,
  `trang_thai` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`ma_dh`, `ma_kh`, `tong_tien`, `phuong_thuc_thanh_toan`, `ngay_lap_dh`, `trang_thai`) VALUES
(31, 9, 1000000, '1', '2023-08-17', 1),
(32, 9, 1000000, '0', '2023-08-18', 1),
(33, 9, 9900000, '0', '2023-08-18', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `ma_kh` int(11) NOT NULL,
  `ten_khach_hang` varchar(50) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` tinyint(2) DEFAULT NULL,
  `dia_chi` varchar(100) DEFAULT NULL,
  `so_dien_thoai` varchar(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khach_hang`
--

INSERT INTO `khach_hang` (`ma_kh`, `ten_khach_hang`, `ngay_sinh`, `gioi_tinh`, `dia_chi`, `so_dien_thoai`, `email`) VALUES
(5, 'admin', '2022-04-06', NULL, 'Quý Sơn-Lục Ngạn-Bắc Giang', '0357143496', 'admin@gmail.com'),
(9, 'hiếu', '2002-05-18', 0, '1A Vinaconex 7, 136 Hồ Tùng Mậu', '0962298198', 'hieuminh180502@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_sp`
--

CREATE TABLE `loai_sp` (
  `ma_loai` varchar(11) NOT NULL,
  `ten_loai_sp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loai_sp`
--

INSERT INTO `loai_sp` (`ma_loai`, `ten_loai_sp`) VALUES
('1', 'Dog toys'),
('2', 'Dog foods'),
('LABC', 'Vip'),
('LABC123', 'Dog toys abc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id` int(11) NOT NULL,
  `ten_dang_nhap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `trang_thai` tinyint(2) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `ten_dang_nhap`, `email`, `mat_khau`, `trang_thai`, `type`) VALUES
(5, 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 0, 0),
(9, 'hieu', 'hieuminh180502@gmail.com', '202cb962ac59075b964b07152d234b70', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `ma_sp` varchar(11) NOT NULL,
  `ma_loai_sp` varchar(11) NOT NULL,
  `ten_sp` varchar(50) NOT NULL,
  `hinh_anh` varchar(255) NOT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `gia_ban` int(11) DEFAULT NULL,
  `thong_tin_them` varchar(500) NOT NULL,
  `trang_thai_sp` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`ma_sp`, `ma_loai_sp`, `ten_sp`, `hinh_anh`, `so_luong`, `gia_ban`, `thong_tin_them`, `trang_thai_sp`) VALUES
('SP004', '1', 'Cat toilet bowl', 'products3.jpg', 0, 49000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them.', 1),
('SP005', '1', 'Bowl with rubber toy', 'products4.jpg', 3, 60000, 'Comfortably take your furry friend for strolls around that big beautiful park that they love so much with the peace of mind knowing everything they need is in the palm of your hands!', 1),
('SP006', '1', 'Dog toys', 'products6.jpg', 0, 15000, ' Poop Bag is here! Comfortably take your furry friend for strolls around that big beautiful park that they love so much with the peace of mind knowing everything they need is in the palm of your hands!', 1),
('SP007', '1', 'Plastic muzzle', 'products7.jpg', 87, 29000, ' ', 1),
('SP008', '2', 'Premium beef rice', 'products13.jpg', 0, 134000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them. The All-In-One Smart Leash with built-in Water Bottle, Food Bowl, and ', 1),
('SP009', '2', 'Premium pork rice', 'products14.jpg', 46, 100000, 'Poop Bag is here! Comfortably take your furry friend for strolls around that big beautiful park that they love so much with the peace of mind knowing everything they need is in the palm of your hands!', 1),
('SP010', '1', 'Pink ceramic cat bowl', 'products10.jpg', 49, 49000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them. The All-In-One Smart Leash with built-in Water Bottle', 1),
('SP011', '1', 'Red dog bed', 'products11.jpg', 28, 125000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them. ', 1),
('SP012', '1', 'Pet chair', 'products9.jpg', 54, 150000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them.', 1),
('SP013', '2', 'Mianlien', 'products15.jpg', 4, 90900, ' abc', 0),
('SPDM1', '1', 'Ánh', 'image-222-hinh-anh-cho-ngao-hai-huoc-doc-nhat-hien-nay-2023-167991005026339.jpg', 95, 200000, ' 1', 1),
('SPDM2', '1', 'Phương', 'Hinh-anh-cho-ngau.jpg', 0, 99000, ' Phương biết nấu cơm', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `anh_sp`
--
ALTER TABLE `anh_sp`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ct_don_hang`
--
ALTER TABLE `ct_don_hang`
  ADD PRIMARY KEY (`ma_dh`,`ma_sp`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`ma_dh`),
  ADD KEY `ma_kh` (`ma_kh`);

--
-- Chỉ mục cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`ma_kh`);

--
-- Chỉ mục cho bảng `loai_sp`
--
ALTER TABLE `loai_sp`
  ADD PRIMARY KEY (`ma_loai`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`ma_sp`),
  ADD KEY `ma_loai_sp` (`ma_loai_sp`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `anh_sp`
--
ALTER TABLE `anh_sp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `ma_dh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `ma_kh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ct_don_hang`
--
ALTER TABLE `ct_don_hang`
  ADD CONSTRAINT `ct_don_hang_ibfk_1` FOREIGN KEY (`ma_dh`) REFERENCES `don_hang` (`ma_dh`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`ma_loai_sp`) REFERENCES `loai_sp` (`ma_loai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
