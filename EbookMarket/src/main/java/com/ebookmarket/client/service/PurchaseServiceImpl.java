package com.ebookmarket.client.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebookmarket.client.domain.Ebook;
import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.Purchase;
import com.ebookmarket.client.mapper.PurchaseMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseMapper mapper;

	// 상품 구매 처리
	@Transactional
	@Override
	public void register(Member member, Ebook ebook) throws Exception {

		int price = ebook.getE_price();
		int e_num = ebook.getE_num();
		int m_num = member.getM_num();

		Purchase purChase = new Purchase();
		purChase.setM_num(m_num);
		purChase.setE_num(e_num);
		purChase.setP_total(price);

		mapper.create(purChase);
		mapper.sell_cnt(purChase);
	}

	// 구매 상품 목록보기
		@Override
		public List<Purchase> memberDownloadList(SearchCriteria scri) throws Exception {
			return mapper.memberDownloadList(scri);
		}

	// 구매 상품 상세보기
	@Override
	public Purchase read(Integer p_num) throws Exception {
		return mapper.read(p_num);

	}

	// 평점
	@Override
	public void modify(Ebook ebook) throws Exception {
		mapper.modify(ebook);
	}

	@Override
	public void refundApply(Purchase purchase) throws Exception {
		mapper.refundApply(purchase);

	}

	@Override
	public void refund_cnt(int e_num) throws Exception {
		mapper.refund_cnt(e_num);
	}

	@Override
	public List<Purchase> refundList(SearchCriteria scri) throws Exception {

		return mapper.refundList(scri);
	}

	@Override
	public void refundProcess(Purchase purchase) throws Exception {
		mapper.refundProcess(purchase);
	}

	@Override
	public void refundApproval(Purchase purchase) throws Exception {
		mapper.refundApproval(purchase);

	}

	@Override
	public List<Purchase> memberRefundList(SearchCriteria scri) throws Exception {

		return mapper.memberRefundList(scri);

	}

	@Override
	public List<Purchase> sellerSalesList(SearchCriteria scri) throws Exception {

		return mapper.sellerSalesList(scri);
	}

	@Override
	public void download_cnt(int e_num) throws Exception {
		mapper.download_cnt(e_num);
	}

	@Override
	public void downloadComplate(int p_num) throws Exception {
		mapper.downloadComplate(p_num);

	}

	@Override
	public void ratingComplate(Purchase purchase) throws Exception {
		mapper.ratingComplate(purchase);

	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}

}
