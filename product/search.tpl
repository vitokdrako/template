<?php echo $header; ?>
<div class="block_breadcrumb">
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
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-4">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-4">
          <?php if ($description) { ?>
            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
            <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <label for="description" class="checkbox-inline"><?php echo $entry_description; ?></label>
        </div>
        <div class="col-sm-4">
            <?php if ($sub_category) { ?>
              <input type="checkbox" id="sub_category" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
              <input type="checkbox" id="sub_category" name="sub_category" value="1" />
            <?php } ?>
            <label for="sub_category" class="checkbox-inline"><?php echo $text_sub_category; ?></label>
        </div>
      </div>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
      <h2><?php echo $text_search; ?></h2>
      <?php if ($products) { ?>
      <div class="row" id="load-format-pagination">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-3">
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
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>