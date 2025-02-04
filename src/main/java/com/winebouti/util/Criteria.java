package com.winebouti.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
    private int pageNum;
    private int amount;

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

}

