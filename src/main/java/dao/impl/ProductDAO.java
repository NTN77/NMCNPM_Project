package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.IProductDAO;
import mapper.ProductMapper;
import model.Product;

public class ProductDAO extends AbstractDAO<Product> implements IProductDAO {
	private static final int PRODUCTS_PER_PAGE = 6;

	@Override
	public List<Product> searchByName(String productName) {
		String sql = "select * from products where LOWER(name) like LOWER(?)";
		return query(sql, new ProductMapper(), "%" + productName + "%", "");
	}

	@Override
	public List<Product> searchByPrice(String productPrice) {
		List<Product> products = new ArrayList<>();
		Double price;
		try {
			price = Double.parseDouble(productPrice);
			String sql = "select * from products where price <= ?";
			products = query(sql, new ProductMapper(), price);
		} catch(NumberFormatException e) {
			products = new ArrayList<>();
		}
		return products;		
	}

	@Override
	public List<Product> searchByDescription(String productDes) {
		String sql = "select * from products where LOWER(description) like LOWER(?)";
		return query(sql, new ProductMapper(), "%" + productDes + "%");
	}

	@Override
	public List<Product> searchByBrand(String productBrand) {
		String sql = "select * from products where LOWER(brand) like LOWER(?)";
		return query(sql, new ProductMapper(), "%" + productBrand + "%");
	}

	@Override
	public int getTotalPages() {
		String sql = "select count(*) as count from products";
		int totalProducts = count(sql);
		return (int) Math.ceil((double) totalProducts / getProductsPerPageConstant());
	}

	@Override
	public List<Product> getProductsPerPage(int currentPage) {
		int offset = (currentPage - 1) * getProductsPerPageConstant();
		String sql = "select * from products limit ?, ?";
		return query(sql, new ProductMapper(), offset, getProductsPerPageConstant());
	}
	/**
	 * Sequence diagram: AddCart - CNPM
	 * 1.1.1.1: getProductById(id) (is sent by ProductService)
	 */
	/**
	 * Sequence diagram: UpdateQuantity - CNPM
	 * 2.1.1.1: getProductById(id) (is sent by ProductService)
	 */
	/**
	 * Sequence diagram: RemoveItem - CNPM
	 * 2.1.6.1: getProductById(id) (is sent by ProductService)
	 */
	@Override
	public List<Product> getProductById(int id) {
		String sql = "select * from products where id=?";
		return query(sql, new ProductMapper(), id);
	}

	public int getProductsPerPageConstant() {
		return PRODUCTS_PER_PAGE;
	}

	public static void main(String[] args) {
		ProductDAO dao = new ProductDAO();
		System.out.println(dao.searchByName("iPhone 11 Pro Max 512GB"));
	}
}