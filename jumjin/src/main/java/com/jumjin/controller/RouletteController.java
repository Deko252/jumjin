package com.jumjin.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Controller;

@Controller
public class RouletteController {
	
	
	public static void main(String[] args) {
		Set<Integer> f_no = new HashSet<Integer>();
		while (f_no.size() < 8) {
			f_no.add( (int) (Math.random() * 45 + 1));
		}
	}
}

