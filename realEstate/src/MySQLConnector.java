import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLConnector {

	public static void main(String[] args) {
		// JDBC와 MySQL Connector를 이용하여 MySQL 연결
		// JDBC : Java Database Connectivity
		// Java에서 데이터베이스와 연결할 수 있도록 도움을 주는 Java API
		// Java에서 SQL 쿼리나 쿼리 결과를 사용할 수 있도록 하는 방법을 제공

		try {

			// 1. 드라이버 로드
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 2. 데이터베이스 연결 URL, USER_NAME, USER_PASSWORD 필요
			// URL "jdbc:mysql://호스트이름:포트번호/데이터베이스이름"
			final String URL = "jdbc:mysql://127.0.0.1:3306/real_estate";
			final String USER_NAME = "root";
			final String USER_PASSWORD = "root";

			Connection connection = DriverManager.getConnection(URL, USER_NAME, USER_PASSWORD);

			// ==== 위까지는 모든 데이터베이스가 동일하게 작업됨 ========
			// ==== 밑에는 sql문 안에 있는 거만 바꿔주면 됨 ======

			// 3. SQL 구문 작성
//			String sql = "INSERT INTO email_authentication VALUES (?, ?)";
//			PreparedStatement preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setString(1, "galaxy@email.com");
//			preparedStatement.setString(2, "QWER");

			// INSERT
//			String sql = "INSERT INTO user (user_id, password, email) VALUES (?, ?, ?)";
//			PreparedStatement preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setString(1, "galaxy");
//			preparedStatement.setString(2, "P!ssw0rd");
//			preparedStatement.setString(3, "galaxy@email.com");

			// SELECT
			String sql = "SELECT * FROM user"; // 구문 안에 ; 사용 안함
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			// SELECT는 테이블 받아야함
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				String id = resultSet.getNString(1);
				String password = resultSet.getString(2);
				String email = resultSet.getString(3);

				System.out.println(id + " " + password + " " + email);

			}

//			// 4. SQL 구문 실행
//			int result = preparedStatement.executeUpdate();
//			if (result == 1) System.out.println("삽입 성공");
//			if (result == 0) System.out.println("삽입 실패");

		} catch (Exception exception) {

			exception.printStackTrace();

		}

	}

}
