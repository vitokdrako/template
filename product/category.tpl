<?php echo $header; ?>
<div class="block_breadcrumb template_category">
    <div class="left"></div>
    <div class="center">
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
    <div class="bg_cat" style="background-image: url(<?php echo $thumb; ?>)"></div>
</div>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($thumb || $description) { ?>
      <div class="row">
        <?php if ($description) { ?>
          <div class="col-sm-12"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($products) { ?>
       <div class="row block-product"  id="load-format-pagination">

        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-4">
          <div class="product-thumb">
            <div class="image"><?php echo $product['sticker']; ?><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <div class="quantity">Доступно: <?php echo $product['quantity']; ?> шт.</div>
				
				<?php if ($product['benefits']) { ?>
				<div class="benefits col-sm-12 hidden-sm hidden-xs">
				<div class="benefit-text"><?php echo $text_benefits; ?></div>
					<ul class="benefit">
					<?php foreach ($product['benefits'] as $benefit) { ?>	
						<?php if ($benefit['type'] == 1) { ?>
							<li class="col-sm-1">
								<?php if (!$benefit['link']) { ?>
								   <span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span>
								<?php } else { ?> 
								   <a href="<?php echo $benefit['link']; ?>" target="_blank" title="<?php echo $benefit['name']; ?>"><span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span></a>
								<?php } ?>
								<?php if ($benefit['description']) { ?>
								<div class="benefit_description"><?php echo $benefit['description']; ?></div>
								<?php } ?>
							</li>
						<?php } ?> 
					<?php } ?>
					</ul>
					</div>
					<div class="present hidden-sm hidden-xs">
						<?php foreach ($product['benefits'] as $benefit) { ?>	
							<?php if ($benefit['type'] == 0) { ?>
								<div>
									<?php if (!$benefit['link']) { ?>
										<span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span>
									<?php } else { ?> 
										<a href="<?php echo $benefit['link']; ?>" target="_blank" title="<?php echo $benefit['name']; ?>"><span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span></a>
									<?php } ?>
								</div>
							<?php } ?> 
						<?php } ?>
					</div>
				<?php } ?>
				
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <div class="button-group">
                <button title="В корзину" class="icon icon_cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"></button>
                <button class="icon_wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o" aria-hidden="true"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <!-- Load Format Pagination -->
        <?php if($limit < $ttl) { ?>
        <div class="col-sm-12">
          <div class="pagination-container">
            <form action="post">
              <button class="btn-load-pagination" id="custom-pagination-button"><div class="title-button"><?php echo $load_more; ?> (<span id="number-products"><?= $config_catalog_limit; ?></span> <?php echo $show_product; ?> <?= $ttl; ?>)</div><div class="load-pagination">
                  <div class="ring-pagination"></div>
              </div></button>
              <input type="hidden" name="load-more-botton" value="<?= $config_catalog_limit; ?>">
              <input type="hidden" name="more-botton-category" value="<?= $category_data; ?>">
              <input type="hidden" name="more-botton-urlcategory" value="<?= $url_category; ?>">
              <input type="hidden" name="more-botton-path" value="<?= $path; ?>">
              <input type="hidden" name="more-botton-sort" value="<?= $sort; ?>">
              <input type="hidden" name="more-botton-filter" value="<?= $filter; ?>">
              <input type="hidden" name="more-botton-order" value="<?= $order; ?>">
              <input type="hidden" name="more-botton-totalproducts" value="<?= $ttl; ?>">
              <input type="hidden" name="more-botton-step" id="more-step" value="<?= $page; ?>">
            </form>
          </div>
        </div>
        <?php } ?>
        <div class="col-sm-12"><?php echo $pagination; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
        <?php if ($description_bottom) { ?>
        <div class="row"><div class="col-sm-10"><?php echo $description_bottom; ?></div></div>
        <?php } ?>
		 <?php echo $content_bottom; ?>
	  </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
