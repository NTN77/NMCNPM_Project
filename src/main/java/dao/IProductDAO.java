package dao;

import java.util.List;

import model.Product;

public interface IProductDAO {
	List<Product> findAll();

	List<Product> searchByName(String productName);

	List<Product> searchByPrice(String productPrice);

	List<Product> searchByDescription(String productDes);

	List<Product> searchByBrand(String productBrand);

	int getTotalPages();

	List<Product> getProductsPerPage(int currentPage);

	List<Product> getProductById(int id);

	int getProductsPerPageConstant();

	boolean create(Product product);

	boolean update(Product product);

	boolean delete(int id);

	Product findProductbyId(int id);
}
