$(function () {
    $li = $(".product_nav .product_array");
    $window = $(".product .product_w");
    $left = $(".product .img_l");
    $right = $(".product .img_r");

    $window.css("width", $li.length * 290);

    if ($li.length < 3) {
        $window.css("margin-left", (868 - $li.length * 290) / 2);
        $window.css("margin-right", (868 - $li.length * 290) / 2);
    }

    var lc = 0;
    var rc = $li.length - 5;

    $left.click(function () {
        if (lc < 1) {
            return;
        }
        lc--;
        rc++;
        $window.animate({ left: '+=290px' }, 1000);
    });

    $right.click(function () {
        if (rc < 1) {
            return;
        }
        lc++;
        rc--;
        $window.animate({ left: '-=290px' }, 1000);
    });

})