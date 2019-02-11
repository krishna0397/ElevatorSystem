package com.model;

import java.util.ArrayList;
import java.util.List;

public class ProductModel {

	private List<Product> products;

	public ProductModel(List<Product> productslist) {
		this.products = new ArrayList<Product>();
		for(int i=0;i<productslist.size();i++) {
			products.add(productslist.get(i));
			
		}
		
	}

	public List<Product> findAll() {
		return this.products;
	}

	public Product find(int id) {
		for (Product product : this.products) {
			if (product.getProduct_id()==id) {
				return product;
			}
		}
		return null;
	}
	public int exists(int id, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getProduct_id()==id) {
				return i;
			}
		}
		return -1;
	}

	


}