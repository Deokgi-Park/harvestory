package kr.ac.cropfit.common;

import java.util.ArrayList;
import java.util.List;

public class Pager {

	int page = 1;
	int perPage = 9;
	float total;
	int perGroup = 5; // getter, setter 생성 필요 없음
	
	String searchValue;

	public int getOffset() {
		return (page - 1) * perPage;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getPrev() { // 삼항연산자 사용하여 첫 페이지 잡아주기
		return page <= perGroup ? 1 : (((page - 1) / perGroup) - 1) * perGroup + 1;
	}

	public int getNext() { // 삼항연산자 사용하여 마지막 페이지 잡아주기
		int next = (((page - 1) / perGroup) + 1) * perGroup + 1;
		int last = getLast();

		return next < last ? next : last;
	}

	public int getLast() {
		return (int) Math.ceil(total / perPage); // 반올림 한 실수를 int형으로 캐스팅하여 반환
	}

	public List<Integer> getList() {
		ArrayList<Integer> list = new ArrayList<Integer>();

		// 현재 소속 된 perGroup의 첫 페이지가 나옴
		int startPage = (((page - 1) / perGroup) + 0) * perGroup + 1;
		int last = getLast();

		for (int index = startPage; index < (startPage + perGroup) && index <= last; index++)
			list.add(index);

		if (list.isEmpty())
			list.add(1);

		return list;
		
	}	

	
	public String getQuery() { // 검색 후 pagination 유지

		if (searchValue != null)
			return "&searchValue=" + searchValue;

		return "";

	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}


}
