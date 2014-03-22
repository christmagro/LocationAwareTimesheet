package chris.lats.com.json_model;






public class GeoJson {
	
	String type;
	Geometry geometry;
//	Object geometry = new ArrayList<CoordinatesJson>();
//	List<CoordinatesJson> coordinates;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Geometry getGeometry() {
		return geometry;
	}
	public void setGeometry(Geometry geometry) {
		this.geometry = geometry;
	}




	
	

}
