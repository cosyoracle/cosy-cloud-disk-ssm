package com.cosyblogs.cloud.disk.model;

import java.util.List;

public class Fpage {
	private int tpicture;
	private int tfile;
	private int tmusic;
	private int tvideo;
	public String[] abc;
	private String[] date;

	public int getTpicture() {
		return tpicture;
	}

	public void setTpicture(int tpicture) {
		this.tpicture = tpicture;
	}

	public int getTfile() {
		return tfile;
	}

	public void setTfile(int tfile) {
		this.tfile = tfile;
	}

	public int getTmusic() {
		return tmusic;
	}

	public void setTmusic(int tmusic) {
		this.tmusic = tmusic;
	}

	public int getTvideo() {
		return tvideo;
	}

	public void setTvideo(int tvideo) {
		this.tvideo = tvideo;
	}

	public String[] getAbc() {
		return abc;
	}

	public void setAbc(String[] abc) {
		this.abc = abc;
	}

	public String[] getDate() {
		return date;
	}

	public void setDate(String[] date) {
		this.date = date;
	}

}
