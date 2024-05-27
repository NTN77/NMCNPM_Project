package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.Product;

public class ProductMapper implements RowMapper<Product> {

	@Override
	public Product mapRow(ResultSet resultSet) {
		try {
			Product product = new Product();
			product.setId(resultSet.getInt("id"));
			product.setName(resultSet.getString("name"));
			product.setDescription(resultSet.getString("description"));
			product.setPrice(resultSet.getFloat("price"));
			product.setSrc(resultSet.getString("src"));
			product.setType(resultSet.getString("type"));
			product.setBrand(resultSet.getString("brand"));
			return product;
		} catch (SQLException e) {
			return null;
		}
	}
}