<div id="cart">
  <div class="icon icon_cart"><span id="cart-total"><?php echo $text_items; ?></span></div>
  <div class="cart_list">
  
    <div class="title_cart">Корзина</div>
    
    <?php if ($products || $vouchers) { ?>
      <ul class="list_products">
      
        <?php foreach ($products as $product) { ?>
        <li class="item_product">
          <div class="img"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></div>
          <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></div>
          <div class="total_quantity"><span>x <?php echo $product['quantity']; ?></span><?php echo $product['total']; ?></div>
          <div class="delete icon" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"></div>
        </li>
        <?php } ?>
      </ul>
      <div class="bottom">
        <?php foreach ($vouchers as $voucher) { ?>
        <div class="voucher">
         <?php echo $voucher['description']; ?>x 1<?php echo $voucher['amount']; ?><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button>
        </div>
        <?php } ?>
        <div class="min-order-warning" style="color: red; font-weight: bold; margin-bottom: 10px;">
         ⚠️ Увага! Замовлення на суму менше 2000 гривень не обробляються.
        </div>
        <div class="totals">
          <?php foreach ($totals as $total) { ?>
            <div class="item_totals">
              <div class="total_title"><?php echo $total['title']; ?></div>
              <div class="total_text"><?php echo $total['text']; ?></div>
            </div>
          <?php } ?>
        </div>
        <div class="btns">
          <a class="btn btn_button bth_hover" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>
          
        </div>
      </div>
    <?php } else { ?>
      <ul class="list_products"><p class="text-center"><?php echo $text_empty; ?></p></ul>
    <?php } ?>
  </div>
</div>
