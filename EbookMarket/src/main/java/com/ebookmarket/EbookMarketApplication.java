package com.ebookmarket;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//mapper 인터페이스 스캔 활성화
@SpringBootApplication
@MapperScan(basePackages = "com.ebookmarket.client.mapper")
@MapperScan(basePackages = "com.ebookmarket.board.mapper")
@MapperScan(basePackages = "com.ebookmarket.admin.mapper")
public class EbookMarketApplication {

	public static void main(String[] args) {
		SpringApplication.run(EbookMarketApplication.class, args);
	}

}
