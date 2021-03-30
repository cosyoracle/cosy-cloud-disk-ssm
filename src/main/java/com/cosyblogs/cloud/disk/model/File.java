package com.cosyblogs.cloud.disk.model;

public class File {
	private int fid;
	private String fname;
	private long fsize;
	private int ftype;
	private String ftime;
	private int fcollect;
	private int fdelete;
	private String fdtime;
	private String fpath;
	private String fsuffix;
	private int fowner;
	private String fownername;
	private int ffolder;
	private int fshare;

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public long getFsize() {
		return fsize;
	}

	public void setFsize(long fsize) {
		this.fsize = fsize;
	}

	public int getFtype() {
		return ftype;
	}

	public void setFtype(int ftype) {
		this.ftype = ftype;
	}

	public String getFtime() {
		return ftime;
	}

	public void setFtime(String ftime) {
		this.ftime = ftime;
	}

	public int getFcollect() {
		return fcollect;
	}

	public void setFcollect(int fcollect) {
		this.fcollect = fcollect;
	}

	public int getFdelete() {
		return fdelete;
	}

	public void setFdelete(int fdelete) {
		this.fdelete = fdelete;
	}

	public String getFdtime() {
		return fdtime;
	}

	public void setFdtime(String fdtime) {
		this.fdtime = fdtime;
	}

	public String getFpath() {
		return fpath;
	}

	public void setFpath(String fpath) {
		this.fpath = fpath;
	}

	public String getFsuffix() {
		return fsuffix;
	}

	public void setFsuffix(String fsuffix) {
		this.fsuffix = fsuffix;
	}

	public int getFowner() {
		return fowner;
	}

	public void setFowner(int fowner) {
		this.fowner = fowner;
	}

	public String getFownername() {
		return fownername;
	}

	public void setFownername(String fownername) {
		this.fownername = fownername;
	}

	public int getFfolder() {
		return ffolder;
	}

	public void setFfolder(int ffolder) {
		this.ffolder = ffolder;
	}

	public int getFshare() {
		return fshare;
	}

	public void setFshare(int fshare) {
		this.fshare = fshare;
	}

	public File() {
		super();
		// TODO Auto-generated constructor stub
	}

	public File(int fid, String fname, long fsize, int ftype, String ftime, int fcollect, int fdelete, String fdtime,
			String fpath, String fsuffix, int fowner, String fownername, int ffolder, int fshare) {
		super();
		this.fid = fid;
		this.fname = fname;
		this.fsize = fsize;
		this.ftype = ftype;
		this.ftime = ftime;
		this.fcollect = fcollect;
		this.fdelete = fdelete;
		this.fdtime = fdtime;
		this.fpath = fpath;
		this.fsuffix = fsuffix;
		this.fowner = fowner;
		this.fownername = fownername;
		this.ffolder = ffolder;
		this.fshare = fshare;
	}

}
