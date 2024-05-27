package model;

import java.util.ArrayList;
import java.util.List;

public class Pagination {
	private int records;
	private List<Product> listProduct;

	public Pagination(int records, List<Product> listProduct) {
		super();
		this.records = records;
		this.listProduct = listProduct;
	}

	public int getRecords() {
		return records;
	}

	public void setRecords(int records) {
		this.records = records;
	}

	public List<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
	}

	public List<Product> getProductPerPage(int currentPage) {
		List<Product> products = new ArrayList<>();
		int startIndex = (currentPage - 1) * records;
		int endIndex = Math.min((startIndex + records), listProduct.size());
		for (int i = startIndex; i < endIndex; i++) {
			products.add(listProduct.get(i));
		}
		return products;
	}
}