package com.winebouti.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class WineVO {
	
	private String type;
    private String originalName;
    private int volume;
    private String origin;
    private int vintage;
    private double alcoholContent;
    private int acidity;
    private int sweetness;
    private int tannins;

}
