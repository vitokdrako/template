<?php echo $header; ?>
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
    <div class="product_block">
      <div class="row">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="share">
            <div class="ya-share2" data-services="facebook,twitter,telegram"></div><span>Поделиться</span>
            <div class="wishlist" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart-o" aria-hidden="true"></i>Добавить в избранное</div>
          </div>
          <?php if ($thumb || $images) { ?>
          <div class="thumbnails">
            <?php if ($thumb) { ?>
              <div class="main-image"><?php echo $sticker; ?><a data-fancybox="gallery_image" class="gallery_image" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
            <?php } ?>
            <?php if ($images) { ?>
              <div class="image-additional">
                <div class="horizontal_slide">
                  <?php foreach ($images as $image) { ?>
                    <a data-fancybox="gallery_image" class="gallery_image" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                  <?php } ?>
                </div>
              </div>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>" id="product">
          <ul class="breadcrumb">
            <?php $count = count($breadcrumbs); foreach ($breadcrumbs as $i=>$breadcrumb) { ?>
              <?php if ($i+1 == $count) { ?>
                <li><span><?php echo $breadcrumb['text']; ?></span></li>
              <?php } else { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><span class="separator">/</span></li>
              <?php } ?>
            <?php } ?>
            </ul>
          <h1><?php echo $heading_title; ?></h1>
          <?php if ($review_status) { ?>
          <div class="rating">
            <a href="" class="reviews" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a>
            <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
          </div>
          <?php } ?>
          <?php if ($price) { ?>
          <ul class="list-unstyled price">
            <?php if (!$special) { ?>
            <li>
              <h2><?php echo $price; ?></h2>
            </li>
            <?php } else { ?>
            <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
            <li>
              <h2><?php echo $special; ?></h2>
            </li>
            <?php } ?>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <div class="block_buy">
              <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
            </div>
          <div class="short_description">
            <?php echo $short_description; ?>
          </div>
          <ul class="list-unstyled list_options">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <span><?php echo $model; ?></span></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <span><?php echo $reward; ?></span></li>
            <?php } ?>
            <li><?php echo $text_stock; ?> <span><?php echo $stock; ?>шт.</span></li>
            <?php if ($length && $width && $height) { ?>
            <li>Длина: <span><?php echo $length; ?><?php echo $weight_class_id; ?></span></li>
            <li>Ширина: <span><?php echo $width; ?><?php echo $weight_class_id; ?></span></li>
            <li>Высота: <span><?php echo $height; ?><?php echo $weight_class_id; ?></span></li>
            <?php } ?>
            <li>Диаметр: <span><?php echo $sku; ?>см</span></li>
            <li>Вес: <span><?php echo $weight; ?><?php echo $length_class_id; ?></span></li>
            <?php echo $mpn; ?>
            <?php if ($ean) { ?>
              <li>Ущерб: <span><?php echo $ean; ?></span></li>
            <?php } ?>
          </ul>
          <div class="product">
            <?php if ($options) { ?>
            <hr>
            <h3><?php echo $text_option; ?></h3>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="ul-price">
              <p>Дополнительно:</p>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?> 
                    <?php if ($option_value['price']) { ?>
                      <span><?php echo $option_value['price']; ?></span>
                    <?php } ?>                   
                    <?php echo $option_value['name']; ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring; ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>
		  
		  <?php if ($benefits) { ?>
		<div class="present">
			<?php foreach ($benefits as $benefit) { ?>	
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
		
		<?php if ($benefits) { ?>
		<div class="benefits col-sm-12">
		<div class="col-sm-4"><?php echo $text_benefits; ?></div>
		<ul class="benefit">
		<?php foreach ($benefits as $benefit) { ?>	
			<?php if ($benefit['type'] == 1) { ?>
				<li class="col-sm-2">
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
		<?php } ?>
		  
        </div>
      </div>

      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
    </div>
    <?php if ($products) { ?>
        <div class="related">
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-xs-8 col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-xs-6 col-md-4'; ?>
        <?php } else { ?>
        <?php $class = 'col-xs-6 col-sm-3'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <div class="quantity">Доступно: <?php echo $product['quantity']; ?> шт.</div>
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
              </div>
              <div class="button-group">
                <button type="button" class="icon icon_cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"></button>
                <button class="icon_wishlist" type="button" data-toggle="tooltip" title="" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o" aria-hidden="true"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif (($i+1) % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
    </div>
      <?php } ?>
      <div class="block-tab">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-terms" data-toggle="tab">Правила аренды</a></li>
            <li class="hidden"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li class="hidden"><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
      <?php foreach($product_tabs as $key => $tab){ ?>
      <li><a href="#tab-<?php echo $product_id ?>-<?php echo $tab['product_tab_id']; ?>" data-toggle="tab"><?php echo $tab['title']; ?></a></li>
      <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-terms">
  <ul>
    <li>Орендарі, із замовленням на суму від <strong>30 000 грн</strong>, отримують <strong>знижку 10%</strong> на все замовлення.</li>
    <li>Мінімальна сума замовлення для обробки та видачі — <strong>2 000 грн</strong>.</li>
    <li>Замовлення приймаються мінімум за <strong>24 години (у робочі дні)</strong> до дня видачі. Замовлення, зроблені менш ніж за 24 години, за умови наявності позицій і готовності команди їх підготувати, оплачуються додатково у розмірі <strong>30%</strong> від вартості замовлення.</li>
    <li>У разі неможливості видати позицію у день видачі, орендодавець пропонує <strong>альтернативу</strong>.</li>
    <li>Вартість оренди декору вказана за <strong>1 добу</strong>. У разі повернення декору після 17:00 дня повернення, із застави автоматично віднімається вартість наступного дня оренди.</li>
    <li>Оренда декору рахується як <strong>2 доби</strong>, якщо замовлення:
      <ul>
        <li>забрали у четвер і повернули у понеділок до 17:00;</li>
        <li>забрали у пʼятницю і повернули у вівторок до 17:00.</li>
      </ul>
    </li>
    <li>Оренда декору рахується як <strong>1 доба</strong>, якщо замовлення:
      <ul>
        <li>забрали у пʼятницю і повернули у понеділок до 17:00.</li>
      </ul>
    </li>
    <li>Незначні зміни у замовленні (збільшення кількості позицій або додавання до 3-х нових) можливі за <strong>12 годин</strong> до початку робочого дня без додаткової оплати.</li>
    <li>Зміни, внесені менш ніж за 12 годин до видачі, за умови наявності позицій і готовності команди, оплачуються у розмірі <strong>30%</strong> від суми доданих позицій.</li>
    <li>Зменшення кількості позицій менш ніж за 12 годин не зменшує вартість оренди, але орендар може залишити декор на зберігання орендодавцю.</li>
    <li>У вартість оренди <strong>не включено</strong> миття, сушку, чищення, реставрацію, а також хімчистку плям, що важко виводяться. Вартість усунення пошкоджень вираховується з застави згідно з установленим прайсом. Вартість додаткових послуг з миття, сушки, чищення та ін. доступна для ознайомлення за посиланням.</li>
    <li>Реквізит необхідно повернути на склад запакованим у такий самий спосіб, як при отриманні. За неповернення упаковки, незапакований або пошкоджений реквізит нараховується сума компенсації, що вираховується із застави.</li>
  </ul>
</div>

            <div class="tab-pane" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
      <?php foreach($product_tabs as $key => $tab){ ?>
      <div class="tab-pane" id="tab-<?php echo $product_id ?>-<?php echo $tab['product_tab_id']; ?>"><?php echo $tab['description']; ?></div>
      <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <p><strong><?php echo $text_write; ?></strong><p>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  
                    <input placeholder="<?php echo $entry_name; ?>" type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  
                </div>
                <div class="form-group required">
                  
                    <textarea placeholder="<?php echo $entry_review; ?>" name="text" rows="5" id="input-review" class="form-control"></textarea>
                  
                </div>
                <div class="form-group required">
                  <div class="rating">
                    <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                   
                    <input type="radio" name="rating" value="2" />
                   
                    <input type="radio" name="rating" value="3" />
                    
                    <input type="radio" name="rating" value="4" />
                    
                    <input type="radio" name="rating" value="5" />
                    <?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_send; ?></button>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
        </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('.cart_list > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});
$(document).ready(function() {
	$('.gallery_image').fancybox({
		btnTpl: {
      arrowLeft:
      '<div data-fancybox-prev class="fancybox-button arrow_fancybox arrow_fancybox_left" title="{{PREV}}"></div>',
      arrowRight:
      '<button data-fancybox-next class="perets fancybox-button fancybox-button--arrow_right" title="{{NEXT}}">' +
      '<div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M15.4 12.97l-2.68 2.72 1.34 1.38L19 12l-4.94-5.07-1.34 1.38 2.68 2.72H5v1.94z"/></svg></div>' +
      "</button>",
    }
	});
  $('.horizontal_slide').slick({
    dots: false,
    arrow: false,
    vertical: false,
    adaptiveHeight: false,
    slidesToScroll: 3,
    speed: 300,
    slidesToShow: 4,
    verticalSwiping: false,
    centerMode: false,
    infinite: false,
  });
});
//--></script>
<?php echo $footer; ?>
