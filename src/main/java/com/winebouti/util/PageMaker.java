package com.winebouti.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageMaker {
    private int totalCount;  // 전체 데이터 개수
    private int startPage;   // 시작 페이지
    private int endPage;     // 끝 페이지
    private boolean prev;    // 이전 버튼 활성화 여부
    private boolean next;    // 다음 버튼 활성화 여부
    private int displayPageNum = 10;  // 한 번에 보여줄 페이지 개수
    private Criteria cri;    // 현재 페이지 정보

    public PageMaker(Criteria cri) { // ✅ 생성자 추가
        this.cri = cri;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();  // 페이징 계산 실행
    }

    private void calcData() {
        endPage = (int) (Math.ceil(cri.getPageNum() / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getAmount()));

        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage > 1;
        next = endPage * cri.getAmount() < totalCount;
    }
}

