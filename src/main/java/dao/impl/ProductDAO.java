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
	public List<Product> findAll(){
		List<Product> products = new ArrayList<Product>();
		try {
			PreparedStatement preparedStatement = AbstractDAO.getConnection().prepareStatement("select * from products");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Product product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getDouble("price"));
				product.setSrc(resultSet.getString("src"));
				product.setType(resultSet.getString("type"));
				product.setBrand(resultSet.getString("brand"));
				products.add(product);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			products = null;

		} finally {
			AbstractDAO.disconnect();
		}
		return products;
	}
	public boolean create(Product product) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = AbstractDAO.getConnection()
					.prepareStatement("insert into products(name,description,price,src,type,brand)"
							+	"values(?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setString(4, product.getSrc());
			preparedStatement.setString(5, product.getType());
			preparedStatement.setString(6, product.getBrand());
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = false;
		} finally {
			AbstractDAO.disconnect();
		}
		return result;
	}
	public boolean update(Product product) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = AbstractDAO.getConnection()
					.prepareStatement("update products set name = ? , description = ? ,price = ?,src = ?,type = ?,brand = ? where id = ?");
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setString(4, product.getSrc());
			preparedStatement.setString(5, product.getType());
			preparedStatement.setString(6, product.getBrand());
			preparedStatement.setInt(7,product.getId());
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = false;
		} finally {
			AbstractDAO.disconnect();
		}
		return result;
	}
	public boolean delete(int id) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = AbstractDAO.getConnection()
					.prepareStatement("DELETE FROM products WHERE id = ?");
			preparedStatement.setInt(1, id);
			result = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			result = false;
		} finally {
			AbstractDAO.disconnect();
		}
		return result;
	}

	public Product findProductbyId(int id) {
		Product product = null;
		try {
			PreparedStatement preparedStatement = AbstractDAO.getConnection().prepareStatement("select * from products where id= ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getDouble("price"));
				product.setSrc(resultSet.getString("src"));
				product.setType(resultSet.getString("type"));
				product.setBrand(resultSet.getString("brand"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			product = null;
		}finally {
			AbstractDAO.disconnect();
		}
		return product	;
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