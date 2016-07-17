﻿$(function () {
    $li = $(".product_nav .product_array");
    $window = $(".product .product_w");
    $left = $(".product .img_l");
    $right = $(".product .img_r");

    $window.css("width", $li.length * 290);

    var lc = 0;
    var rc = $li.length - 5;

    $left.click(function () {
        if (lc < 1) {
            alert("已经是第一张图片");
            return;
        }
        lc--;
        rc++;
        $window.animate({ left: '+=290px' }, 1000);
    });

    $right.click(function () {
        if (rc < 1) {
            alert("已经是最后一张图片");
            return;
        }
        lc++;
        rc--;
        $window.animate({ left: '-=290px' }, 1000);
    });

})