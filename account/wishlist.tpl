<?php echo $header; ?>
<div class="block_breadcrumb template_information">
  <h1><?php echo $heading_title; ?></h1>
  <ul class="breadcrumb">
    <?php $count = count($breadcrumbs); foreach ($breadcrumbs as $i=>$breadcrumb) { ?>
      <?php if ($i+1 == $count) { ?>
        <li><span><?php echo $breadcrumb['text']; ?></span></li>
      <?php } else { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><i class="fa fa-angle-right" aria-hidden="true"></i></li>
      <?php } ?>
    <?php } ?>
  </ul>
</div>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($products) { ?>
      <ul class="list_products list_wishlist">
            <li class="thead">

              <div class="model"><?php echo $column_model; ?></div>
              <div class="price"><?php echo $column_price; ?></div>
              <div class="total"><?php echo $column_action; ?></div>
            </li>
            <?php foreach ($products as $product) { ?>
            <li class="item_product">
              <div class="image_product"><?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?></div>
              <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
              <div class="model"><?php echo $product['model']; ?></div>
              <div class="c_price"><?php if ($product['price']) { ?>
                
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                  <?php } ?>
                
                <?php } ?></div>
              <div class="text-right">
                <div class="button-group">
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" title="<?php echo $button_cart; ?>" class="icon icon_cart"></button>
                  <a href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>" class="delete icon"></a>
              </div>
            </li>
            <?php } ?>
      </ul>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      
        <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>