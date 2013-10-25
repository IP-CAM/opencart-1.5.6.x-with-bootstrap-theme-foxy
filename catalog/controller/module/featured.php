<?php
class ControllerModuleFeatured extends Controller {
	protected function index($setting) {
		$this->language->load('module/featured'); 

      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');

		$this->data['products'] = array();

		$products = explode(',', $this->config->get('featured_product'));		

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$products = array_slice($products, 0, (int)$setting['limit']);

		// krevnyi
		if ($setting['position'] == 'content_top' OR $setting['position'] == 'content_bottom')
		{
			$this->language->load('product/product');

			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_reward'] = $this->language->get('text_reward');
			$this->data['text_points'] = $this->language->get('text_points');	
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_stock'] = $this->language->get('text_stock');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_option'] = $this->language->get('text_option');
			$this->data['text_qty'] = $this->language->get('text_qty');
			$this->data['text_or'] = $this->language->get('text_or');
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_note'] = $this->language->get('text_note');
			$this->data['text_share'] = $this->language->get('text_share');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_tags'] = $this->language->get('text_tags');
		}
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}

				// krevnyi
				$this->load->model('catalog/product');
		
				$full_product_info = $this->model_catalog_product->getProduct($product_info['product_id']);

				$images = $this->model_catalog_product->getProductImages($product_info['product_id']);
				$product_images = array();
			
				foreach ($images as $image_item) {
					$product_images[] = array(
						'popup' => $this->model_tool_image->resize($image_item['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
						'thumb' => $this->model_tool_image->resize($image_item['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
					);
				}

				if ($full_product_info['quantity'] <= 0) {
					$stock = $full_product_info['stock_status'];
				} elseif ($this->config->get('config_stock_display')) {
					$stock = $full_product_info['quantity'];
				} else {
					$stock = $this->language->get('text_instock');
				}

				if ($full_product_info['minimum']) {
					$minimum = $full_product_info['minimum'];
				} else {
					$minimum = 1;
				}

				$discounts_result = $this->model_catalog_product->getProductDiscounts($product_info['product_id']);
			
				$discounts = array(); 
				
				foreach ($discounts_result as $discount) {
					$discounts[] = array(
						'quantity' => $discount['quantity'],
						'price'    => $this->currency->format($this->tax->calculate($discount['price'], $full_product_info['tax_class_id'], $this->config->get('config_tax')))
					);
				}

				if ($product_info['image']) {
					$popup = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$popup = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
				} else {
					$tax = false;
				}
					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),

					'images'      			 => $product_images,
					'tax'     	 			 => $tax,
					'popup'      			 => $popup,
					'minimum'      			 => $minimum,
					'model'			         => $full_product_info['model'],
					'reward'		         => $full_product_info['reward'],
					'points'		         => $full_product_info['points'],
					'manufacturer'	         => $full_product_info['manufacturer'],
					'manufacturers'	         => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $full_product_info['manufacturer_id']),
					'stock'	         		 => $stock,
					'discounts'        		 => $discounts,
				);
			}
		}

		// krevnyi
		$this->data['position'] = $setting['position'];

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured.tpl';
		} else {
			$this->template = 'default/template/module/featured.tpl';
		}

		$this->render();
	}
}
?>