package service;

import java.util.List;

import model.Product;

public interface IProductService {
	
	List<Product> searchByName(String productName);
	
	List<Product> searchByPrice(String productPrice);
	
	List<Product> searchByDescription(String productDes);
	
	List<Product> searchByBrand(String productBrand);
	
	int getTotalPages();
	
	List<Product> getProductsPerPage(int currentPage);

	Product getProductById(int id);

	int getProductsPerPageConstant();
}