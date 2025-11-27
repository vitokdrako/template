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
  <div class="alert alert-success"><?php echo $success; ?><div class="icon icon_close close" data-dismiss="alert"></div></div>
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
      <ul class="list-unstyled account_link">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        
        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      </ul>
      <?php if ($credit_cards) { ?>
      <h2><?php echo $text_credit_card; ?></h2>
      <ul class="list-unstyled">
        <?php foreach ($credit_cards as $credit_card) { ?>
        <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
        <?php } ?>
      </ul>
      <?php } ?>
   
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 