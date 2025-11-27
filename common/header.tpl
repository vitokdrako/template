<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-3N8X173Z67"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-3N8X173Z67');
</script>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<?php echo $load_format_pagination; ?>
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php /** Load Format Pagintion**/ echo $load_format_pagination; ?>
</head>
<body class="<?php echo $class; ?>">
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-P335GW44"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<header>
  <div class="container-fluid">
    <div class="row">
      <div class="col-auto d-flex">
        <div id="logo">
          <?php if ($logo) { ?>
            <a class="logo" href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
        <div class="phone"><?php $tel = preg_replace("/[^0-9]/", '', $telephone); ?>
          <a href="tel:<?php echo $tel; ?>"><i class="fa fa-phone" aria-hidden="true"></i><?php echo $telephone; ?></a>
        </div>
      </div>
      <div class="col">
        <div class="nav">
      <? if($use_megamenu) { ?>
      <nav id="megamenu-menu">
    
   
      <ul class="nav">
        <?php foreach ($items as $item) { ?>
        <?php if ($item['children'] & count($item['children']) > 1) { ?>
    
        <li class="dropdown">
    
    <a href="<?php echo $item['href']; ?>" <?php if($item['use_target_blank'] == 1) { echo ' target="_blank" ';} ?> <?php if($item['type'] == "link") {echo 'data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>><?if($item['thumb']){?>
    <img class="megamenu-thumb" src="<?=$item['thumb']?>"/>
    <?}?><?php echo $item['name']; ?><i class="fa fa-angle-down" aria-hidden="true"></i></a>
    
    <?if($item['type']=="category"){?>
    <?if($item['subtype']=="simple"){?>
          <div class=" megamenu-type-category-simple">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
            
          <ul class="list-unstyled megamenu-haschild">
                <?php foreach ($children as $child) { ?>
                <li class="<?if(count($child['children'])){?> megamenu-issubchild<?}?>"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
        
        <?if(count($child['children'])){?>
        <ul class="list-unstyled megamenu-ischild megamenu-ischild-simple">
         <?php foreach ($child['children'] as $subchild) { ?>
        <li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>        
        <?}?>
        </ul>
        <?}?>       
        </li>
                <?php } ?>
        </ul>
        
        
        
              <?php } ?>
            </div>            
      </div>
      <?}?> 
      <?}?>
      
    <?if($item['type']=="category"){?>
    <?if($item['subtype']=="full"){?>
          <div class="megamenu-type-category-full dropdown_menu">
            <div class="dropdown-inner">
              <div class="container">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
          <?if($item['add_html']){?>
        <div style="" class="menu-add-html">
        <?=$item['add_html'];?>
        </div>
        <?}?>
        
          <ul class="list-unstyled megamenu-haschild">
            <div class="back"><i class="fa fa-angle-left" aria-hidden="true"></i> Назад</div>
                <?php foreach ($children as $child) { ?>
                <li class="megamenu-parent-block<?if(count($child['children'])){?> megamenu-issubchild<?}?>"><a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a><?if(count($child['children'])){?><span><i class="fa fa-angle-down" aria-hidden="true"></i></span><?}?>
        
        <?if(count($child['children'])){?>
        <ul class="list-unstyled megamenu-ischild">
          <?php foreach ($child['children'] as $subchild) { ?>
            <li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>        
          <?}?>
        </ul>
        <?}?>       
        </li>
                <?php } ?>
        </ul>
              <?php } ?>
            </div>   
          </div>         
      </div>
      <?}?> 
      <?}?>
      
      <?if($item['type']=="category"){?>
    <?if($item['subtype']=="full_image"){?>
          <div class="dropdown_menu megamenu-type-category-full-image">
            <div class="icon icon_close"></div>
            <div class="h1"><span class="line">Каталог</span></div>
            <div class="dropdown-inner container">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
          <?if($item['add_html']){?>
        <div style="" class="menu-add-html">
        <?=$item['add_html'];?>
        </div>
        <?}?>
        
          <ul class="list-unstyled megamenu-haschild">
                <?php foreach ($children as $child) { ?>
                <li class="megamenu-parent-block<?if(count($child['children'])){?> megamenu-issubchild<?}?>">
        <a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="" title=""/></a>
        <a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
        
        <?if(count($child['children'])){?>
        <ul class="list-unstyled megamenu-ischild">
         <?php foreach ($child['children'] as $subchild) { ?>
        <li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>        
        <?}?>
        </ul>
        <?}?>       
        </li>
                <?php } ?>
        </ul>
              <?php } ?>
            </div>            
      </div>
      <?}?> 
      <?}?>
      
      
      <?if($item['type']=="html"){?>
    
          <div class=" megamenu-type-html">
            <div class="dropdown-inner">
              
            
        
        
          <ul class="list-unstyled megamenu-haschild">
                
                <li class="megamenu-parent-block<?if(count($child['children'])){?> megamenu-issubchild<?}?>">
        <div class="megamenu-html-block">       
        <?=$item['html']?>
        </div>
        </li>
                      </ul>
            
            </div>            
      </div>
        
      <?}?>
      
      
    
      
    <?if($item['type']=="manufacturer"){?>

          <div class=" megamenu-type-manufacturer <?if($item['add_html']){?>megamenu-bigblock<?}?>">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
         <?if($item['add_html']){?>
        <div style="" class="menu-add-html">
        <?=$item['add_html'];?>
        </div>
        <?}?>
        
          <ul class="list-unstyled megamenu-haschild <?if($item['add_html']){?>megamenu-blockwithimage<?}?>">
                <?php foreach ($children as $child) { ?>
                <li class="megamenu-parent-block">
        <a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="" title="" /></a>
        <a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
        
          
        </li>
                <?php } ?>
        </ul>
              <?php } ?>
            </div>            
      </div>
    
      <?}?>
      
        <?if($item['type']=="information"){?>
  		
          <div class=" megamenu-type-information <?if($item['add_html']){?>megamenu-bigblock<?}?>">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
        <?if($item['add_html']){?>
        <div style="" class="menu-add-html">
        <?=$item['add_html'];?>
        </div>
        <?}?>
        
          <ul class="list-unstyled megamenu-haschild <?if($item['add_html']){?>megamenu-blockwithimage<?}?>">
                <?php foreach ($children as $child) { ?>
                <li class=""><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
        
          
        </li>
                <?php } ?>
        </ul>
              <?php } ?>
            </div>            
      </div>
    
      <?}?>
      
      
      
        <?if($item['type']=="product"){?>

          <div class=" megamenu-type-product <?if($item['add_html']){?>megamenu-bigblock<?}?>">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
         <?if($item['add_html']){?>
        <div style="" class="menu-add-html">
        <?=$item['add_html'];?>
        </div>
        <?}?>
        
          <ul class="list-unstyled megamenu-haschild <?if($item['add_html']){?>megamenu-blockwithimage<?}?>">
                <?php foreach ($children as $child) { ?>
                <li class="megamenu-parent-block">
        <a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="" title="" /></a>
        <a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
        <div class="dropprice">
        <?if($child['special']){?><span><?}?><?php echo $child['price']; ?><?if($child['special']){?></span><?}?><?php echo $child['special']; ?>
        </div>        
        </li>
                <?php } ?>
        </ul>
              <?php } ?>
            </div>            
      </div>
    
      <?}?>
      
      
          <?if($item['type']=="auth"){?>
    
          <div class=" megamenu-type-auth">
            <div class="dropdown-inner">
              
            
        
        
          <ul class="list-unstyled megamenu-haschild">
                
                <li class="megamenu-parent-block<?if(count($child['children'])){?> megamenu-issubchild<?}?>">
        <div class="megamenu-html-block">       
          
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
        <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></div>
        
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
             
            </form>
      
      
        </div>
        </li>
                      </ul>
            
            </div>            
      </div>
        
      <?}?>
      
        </li>
    
    
    
        <?php } else { ?>
          <li>
            <a href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?></a>
          </li>
        <?php } ?>
        <?php } ?>    
      </ul>
  
  </nav>

<?}?>
<?php if ($categories && !$use_megamenu) { ?>
      <nav id="menu" class="navbar">
        <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
          <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown">
              <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?><i class="fas fa-angle-down"></i></a>
              <div class="">
                <div class="dropdown-inner">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                  <ul class="list-unstyled">
                    <?php foreach ($children as $child) { ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <?php } ?>
                </div>
                <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
        </div>
      </nav>
      <?php } ?>
      <?php echo $search; ?>
      <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
      <?php echo $cart; ?>
      <div class="personal">
        <div class="dropdown">
                <div class="icon icon_user"></div>
                <ul class="dropdown_block">
                  <?php if ($logged) { ?>
                  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                    <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                  <?php } else { ?>
                  <li><a class="register" href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                  <li><a class="login" href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                  <?php } ?>
                </ul>
              </div>
      </div>
    </div>
  </div>
  <div class="d-flex d-md-none">
    <div class="btn_mobile_menu">
      <span></span>
    </div>
  </div>
  </div>
</div>
</header>
<main>

