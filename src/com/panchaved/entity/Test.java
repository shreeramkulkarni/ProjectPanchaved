package com.panchaved.entity;

import java.io.File;
import java.nio.file.FileSystem;

import org.springframework.util.FileSystemUtils;

public class Test {

	public static void main(String[] args) {
		String s = System.getenv("PANCH_HOME")+"\\140_babya";
		File f = new File(s);
		if (f.exists()) {
			
			System.out.println("exits");
			System.out.println(FileSystemUtils.deleteRecursively(f));
		}
		
	}

}
