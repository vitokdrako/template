<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Підтвердження замовлення</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
            background-color: #f5f5f5; padding: 20px; line-height: 1.6;
        }
        .email-container { max-width: 650px; margin: 0 auto; background-color: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
        .email-header { background: #cdcdcd; padding: 40px 30px; text-align: center; }
        .logo-container { display: inline-block; }
        .logo-container img { height: 40px; width: auto; }
        .order-title { margin-top: 25px; color: #ffffff; font-size: 24px; font-weight: 600; text-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .order-number { color: #ffffff; font-size: 18px; margin-top: 8px; font-weight: 500; }
        .email-body { padding: 40px 30px; }
        .greeting { font-size: 20px; color: #2c2c2c; margin-bottom: 20px; font-weight: 600; }
        .message-text { font-size: 16px; color: #555555; margin-bottom: 20px; line-height: 1.7; }
        .products-section { margin: 30px 0; }
        .section-title { font-size: 18px; color: #2c2c2c; font-weight: 600; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #d4a574; }
        .product-item { display: table; width: 100%; margin-bottom: 25px; padding: 20px; background-color: #fafafa; border-radius: 8px; border: 1px solid #e8e8e8; }
        .product-image { display: table-cell; width: 120px; vertical-align: top; padding-right: 20px; }
        .product-image img { width: 120px; height: 120px; object-fit: cover; border-radius: 6px; border: 2px solid #e8e8e8; }
        .product-details { display: table-cell; vertical-align: top; }
        .product-name { font-size: 16px; font-weight: 600; color: #2c2c2c; margin-bottom: 8px; }
        .product-name a { color: #2c2c2c; text-decoration: none; }
        .product-name a:hover { color: #d4a574; }
        .product-info { font-size: 14px; color: #666666; margin: 5px 0; }
        .product-info strong { color: #2c2c2c; }
        .damage-info { background-color: #fff3e6; border-left: 4px solid #d4a574; padding: 12px 15px; margin-top: 12px; border-radius: 4px; }
        .damage-label { font-size: 13px; font-weight: 600; color: #c89d6a; margin-bottom: 4px; }
        .damage-value { font-size: 14px; color: #555555; }
        .totals-section { background-color: #f9f9f9; padding: 25px; border-radius: 8px; margin: 30px 0; }
        .total-row { display: flex; justify-content: space-between; padding: 10px 0; font-size: 15px; }
        .total-row.final { border-top: 2px solid #d4a574; margin-top: 10px; padding-top: 15px; font-size: 18px; font-weight: 700; color: #2c2c2c; }
        .total-label { color: #555555; }
        .total-value { font-weight: 600; color: #2c2c2c; }
        .info-box { background: linear-gradient(135deg, #f8f3ed 0%, #faf7f2 100%); border: 2px solid #d4a574; border-radius: 10px; padding: 25px; margin: 30px 0; }
        .info-title { font-size: 17px; font-weight: 600; color: #c89d6a; margin-bottom: 15px; display: flex; align-items: center; }
        .info-text { font-size: 14px; color: #555555; line-height: 1.8; margin-bottom: 10px; }
        .info-text:last-child { margin-bottom: 0; }
        .signature { text-align: center; margin-top: 30px; padding-top: 25px; border-top: 1px solid #e8e8e8; }
        .signature-text { font-size: 15px; color: #555555; margin-bottom: 8px; }
        .team-name { font-size: 17px; font-weight: 600; color: #d4a574; }
        .email-footer { background-color: #f8f9fa; padding: 30px; text-align: center; border-top: 1px solid #e8e8e8; }
        .footer-divider { border: 0; height: 1px; background: linear-gradient(to right, transparent, #d4a574, transparent); margin: 20px 0; }
        .contact-info { margin: 15px 0; }
        .contact-item { display: inline-block; margin: 8px 20px; font-size: 14px; color: #555555; }
        .contact-item a { color: #6B7280; text-decoration: none; font-weight: 600; }
        .contact-item a:hover { color: #d4a574; }
        .icon { display: inline-block; width: 16px; height: 16px; margin-right: 6px; vertical-align: middle; }
        @media only screen and (max-width: 600px) {
            body { padding: 10px; }
            .email-header { padding: 30px 20px; }
            .email-body { padding: 25px 20px; }
            .product-item { display: block; }
            .product-image { display: block; width: 100%; text-align: center; padding-right: 0; margin-bottom: 15px; }
            .product-details { display: block; }
            .contact-item { display: block; margin: 10px 0; }
            .order-title { font-size: 20px; }
            .greeting { font-size: 18px; }
        }
    </style>
</head>
<body>
    <div class="email-container">
        <!-- Header -->
        <div class="email-header">
            <div class="logo-container">
                <img src="https://www.farforrent.com.ua/image/logo.png" alt="FarforDecorOrenda">
            </div>
            <div class="order-title">Замовлення прийнято!</div>
            <div class="order-number">№ <?php echo $order_id; ?></div>
        </div>

        <!-- Body -->
        <div class="email-body">
            <div class="greeting">Шановний Клієнте!</div>
            <div class="message-text">
                Дякуємо за Ваше замовлення! Якнайшвидше ми приступимо до його обробки, та з радістю повідомимо Вас про наявність та готовність до видачі.
                Ви можете уточнити деталі замовлення через нашого бота у Telegram.
                <a href="https://t.me/FarforDecorOrendaBot" target="_blank" style="text-decoration:none;">
                  <img src="https://www.farforrent.com.ua/image/telegram.png" alt="Telegram" width="40" height="40" style="vertical-align:middle;margin:0 4px 3px 4px;border:0;">
                </a>
            </div>

            <!-- Products Section -->
            <div class="products-section">
                <div class="section-title">Ваше замовлення</div>

                <?php $total_damage = 0.0; // сумарна відповідальність по всіх товарах ?>

                <?php foreach ($products as $product) { ?>
                <div class="product-item">
                    <div class="product-image">
                        <a href="<?php echo $product['href']; ?>">
                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                        </a>
                    </div>
                    <div class="product-details">
                        <div class="product-name">
                            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        </div>
                        <div class="product-info">
                            <strong>Модель:</strong> <?php echo $product['model']; ?>
                        </div>
                        <div class="product-info">
                            <strong>Кількість:</strong> <?php echo (int)$product['quantity']; ?> шт.
                        </div>
                        <div class="product-info">
                            <strong>Ціна:</strong> <?php echo $product['price']; ?>
                        </div>

                        <?php
                            // Беремо збиток із $product['damage'], якщо нема — з $product['ean']
                            $__raw_damage = '';
                            if (isset($product['damage']) && $product['damage'] !== '') {
                                $__raw_damage = (string)$product['damage'];
                            } elseif (isset($product['ean']) && $product['ean'] !== '') {
                                $__raw_damage = (string)$product['ean'];
                            }

                            // Для підрахунку: чистимо символи, лишаємо цифри/крапку/кому
                            $__damage_unit = 0.0;
                            if ($__raw_damage !== '') {
                                $__damage_unit = (float) str_replace([',', ' '], ['.', ''], preg_replace('/[^\d,.\-]/', '', $__raw_damage));
                            }

                            $__qty = isset($product['quantity']) ? (int)$product['quantity'] : 0;
                            $total_damage += $__damage_unit * $__qty;
                        ?>

                        <?php if ($__raw_damage !== '') { ?>
                        <div class="damage-info">
                            <div class="damage-label">Збиток:</div>
                            <div class="damage-value">
                                <?php echo htmlspecialchars($__raw_damage, ENT_QUOTES, 'UTF-8'); ?>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                </div>
                <?php } ?>
            </div>

            <!-- Totals -->
            <div class="totals-section">
                <?php if (!empty($totals)) { ?>
                    <?php foreach ($totals as $total) { ?>
                        <?php if ($total['code'] == 'total') { ?>
                        <div class="total-row final">
                            <span class="total-label"><?php echo $total['title']; ?>:</span>
                            <span class="total-value"><?php echo $total['text']; ?></span>
                        </div>
                        <?php } else { ?>
                        <div class="total-row">
                            <span class="total-label"><?php echo $total['title']; ?>:</span>
                            <span class="total-value"><?php echo $total['text']; ?></span>
                        </div>
                        <?php } ?>
                    <?php } ?>
                <?php } ?>

                <!-- Додаємо підсумок відповідальності та застави -->
                <div class="total-row">
                    <span class="total-label">Загальна сума шкоди:</span>
                    <span class="total-value"><?php echo number_format($total_damage, 0, '.', ' '); ?> грн</span>
                </div>

                <?php $deposit = $total_damage / 2; ?>
                <div class="total-row final">
                    <span class="total-label">Сума застави (50% від вартості шкоди):</span>
                    <span class="total-value"><?php echo number_format($deposit, 0, '.', ' '); ?> грн</span>
                </div>
            </div>

            <!-- Important Information -->
            <div class="info-box">
                <div class="info-title">Важлива інформація</div>

                <div class="info-text">
                    <img src="https://www.farforrent.com.ua/image/obrobka.png" alt="Обробка" width="20" height="20" style="vertical-align:middle;margin-right:6px;">
                    <strong>Обробка замовлень:</strong> понеділок–п’ятниця з 10:00 до 18:00
                </div>

                <div class="info-text">
                    <img src="https://www.farforrent.com.ua/image/povernenya.png" alt="Повернення" width="20" height="20" style="vertical-align:middle;margin-right:6px;">
                    <strong>Видача і повернення замовлень:</strong> з 10:00 до 17:00
                </div>

                <div class="info-text">
                    <img src="https://www.farforrent.com.ua/image/minimal.png" alt="Мінімальна сума" width="20" height="20" style="vertical-align:middle;margin-right:6px;">
                    <strong>Мінімальна сума замовлення:</strong> 2000 грн для обробки та видачі
                </div>

                <div class="info-text">
                    <img src="https://www.farforrent.com.ua/image/vidpovidalnist.png" alt="Відповідальність" width="20" height="20" style="vertical-align:middle;margin-right:6px;">
                    <strong>Відповідальність:</strong> Орендар або його довірена особа беруть на себе відповідальність за перевірку підготовлених позицій на кількість та наявність відповідно до накладної.
                </div>

                <div class="info-text">
                    <img src="https://www.farforrent.com.ua/image/zastava.png" alt="Застава" width="20" height="20" style="vertical-align:middle;margin-right:6px;">
                    <strong>Повернення застави:</strong> Якщо повернення здійснюється у неробочий час, орендар може отримати заставу у найближчий робочий день.
                </div>
            </div>

            <!-- Signature -->
            <div class="signature">
                <div class="signature-text">З повагою,</div>
                <div class="team-name">Команда FarforDecorOrenda</div>
            </div>
        </div>

        <!-- Footer -->
        <div class="email-footer">
            <hr class="footer-divider">
            <div class="contact-info">
                <div class="contact-item">
                    <span class="icon">📞</span>
                    <a href="tel:+380971230993">38 (097) 123 09 93</a>
                </div>
                <div class="contact-item">
                    <span class="icon">✉️</span>
                    <a href="mailto:farfordecor@gmail.com">farfordecor@gmail.com</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>