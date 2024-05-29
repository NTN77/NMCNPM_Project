package service.impl;

import java.util.List;

import dao.IProductDAO;
import dao.impl.ProductDAO;
import model.Product;
import service.IProductService;

public class ProductService implements IProductService {
	private IProductDAO productDAO;

	public ProductService() {
		this.productDAO = new ProductDAO();
	}

	@Override
	public List<Product> searchByName(String productName) {
		return this.productDAO.	searchByName(productName);
	}

	@Override
	public List<Product> searchByPrice(String productPrice) {
		return this.productDAO.searchByPrice(productPrice);
	}

	@Override
	public List<Product> searchByDescription(String productDes) {
		return this.productDAO.searchByDescription(productDes);
	}

	@Override
	public List<Product> searchByBrand(String productBrand) {
		return this.productDAO.searchByBrand(productBrand);
	}

	@Override
	public int getTotalPages() {
		return this.productDAO.getTotalPages();
	}

	@Override
	public List<Product> getProductsPerPage(int currentPage) {
		return this.productDAO.getProductsPerPage(currentPage);
	}
	/**
	 * Sequence diagram: AddCart - CNPM
	 * 2.1.1: getProductById(id) (is sent by AddToCartServlet)
	 * 2.1.1.2: List<Product> (is replied by ProductDAO)
	 */
	/**
	 * Sequence diagram: UpdateQuantity - CNPM
	 * 3.1.1: getProductById(id) (is sent by AddToCartServlet)
	 * 3.1.1.2: List<Product> (is replied by ProductDAO)
	 */
	/**
	 * Sequence diagram: RemoveItem - CNPM
	 * 3.2.5: getProductById(id) (is sent by AddToCartServlet)
	 * 3.2.5.2: List<Product> (is replied by ProductDAO)
	 */
	@Override
	public Product getProductById(int id) {
		return this.productDAO.getProductById(id).get(0);
	}

	@Override
	public int getProductsPerPageConstant() {
		return this.productDAO.getProductsPerPageConstant();
	}
}