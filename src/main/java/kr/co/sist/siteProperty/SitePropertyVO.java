package kr.co.sist.siteProperty;

public class SitePropertyVO {
	private String protocol,server_name,context_root,manage_path,key,title;

	@Override
	public String toString() {
		return "SitePropertyVO [protocol=" + protocol + ", server_name=" + server_name + ", context_root="
				+ context_root + ", manage_path=" + manage_path + ", key=" + key + ", title=" + title + "]";
	}

	public SitePropertyVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SitePropertyVO(String protocol, String server_name, String context_root, String manage_path, String key,
			String title) {
		super();
		this.protocol = protocol;
		this.server_name = server_name;
		this.context_root = context_root;
		this.manage_path = manage_path;
		this.key = key;
		this.title = title;
	}

	public String getProtocol() {
		return protocol;
	}

	public String getServer_name() {
		return server_name;
	}

	public String getContext_root() {
		return context_root;
	}

	public String getManage_path() {
		return manage_path;
	}

	public String getKey() {
		return key;
	}

	public String getTitle() {
		return title;
	} 
}
