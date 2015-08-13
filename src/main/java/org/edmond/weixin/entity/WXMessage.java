package org.edmond.weixin.entity;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="xml")
public class WXMessage implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public WXMessage() {
	}
	/**
	 * 公共字段
	 */
	
	/**
	 * 消息类型：
	 * text时为文本型，
	 * 图片消息 image,
	 * 语音消息 voice,
	 * 视频消息 video,
	 * 小视频消息 shortvideo,
	 * 地理位置消息 location，
	 * 链接消息 link
	 * 事件消息 event
	 * 音乐消息 music
	 * 图文消息 news
	 */
	private String msgType;
	private String toUserName;
	private String fromUserName;
	private Long createTime;
	private Long msgId;
	
	//////////////以下为消息相关字段////////////////////////////////
	/**
	 * 消息内容
	 */
	private String content;
	
	/**
	 * 图片链接
	 */
	private String picUrl;
	/**
	 * 图片消息媒体id，可以调用多媒体文件下载接口拉取数据
	 */
	private String mediaId;
	/**
	 * 语音格式，如amr，speex等
	 */
	private String format;
	/**
	 * 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据
	 */
	private String thumbMediaId;
	/**
	 * 地理位置维度
	 */
	private String location_X;	
	/**
	 * 地理位置经度
	 */
	private String location_Y;	
	/**
	 * 地图缩放大小
	 */
	private String scale;	
	/**
	 * 地理位置信息
	 */
	private String label;	
	/**
	 * 链接消息标题
	 */
	private String title;
	/**
	 * 链接消息描述
	 */
	private String description;
	/**
	 * 消息链接
	 */
	private String url;
	/**
	 * 语音识别结果，UTF8编码
	 */
	private String recognition;
	/**
	 * 音乐链接
	 */
	private String musicURL;
	/**
	 * 高质量音乐链接，WIFI环境优先使用该链接播放音乐
	 */
	private String HQMusicUrl;
	/**
	 * 图文消息个数，限制为10条以内
	 */
	private String articleCount;
	/**
	 * 多条图文消息信息，默认第一个item为大图,注意，如果图文数超过10，则将会无响应
	 */
	private String articles;
	//////////////////////以下为事件相关字段/////////////////////
	/**
	 * 事件类型，subscribe(订阅)、unsubscribe(取消订阅)、SCAN、LOCATION、CLICK（自定义菜单点击)、VIEW（点击菜单跳转链接)
	 */
	private String event;
	/**
	 * 事件KEY值，qrscene_为前缀，后面为二维码的参数值
	 */
	private String eventKey;
	/**
	 * 二维码的ticket，可用来换取二维码图片
	 */
	private String ticket;
	/**
	 * 地理位置纬度
	 */
	private String latitude;
	/**
	 * 地理位置经度
	 */
	private String longitude;
	/**
	 * 地理位置精度
	 */
	private String precision;

	@XmlElement(name="ToUserName")
	public String getToUserName() {
		return toUserName;
	}
	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
	@XmlElement(name="FromUserName")
	public String getFromUserName() {
		return fromUserName;
	}
	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}
	@XmlElement(name="CreateTime")
	public Long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}
	@XmlElement(name="MsgType")
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	@XmlElement(name="MsgId")
	public Long getMsgId() {
		return msgId;
	}
	public void setMsgId(Long msgId) {
		this.msgId = msgId;
	}
	@XmlElement(name="Content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@XmlElement(name="PicUrl")
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	@XmlElement(name="MediaId")
	public String getMediaId() {
		return mediaId;
	}
	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}
	@XmlElement(name="Format")
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	@XmlElement(name="ThumbMediaId")
	public String getThumbMediaId() {
		return thumbMediaId;
	}
	public void setThumbMediaId(String thumbMediaId) {
		this.thumbMediaId = thumbMediaId;
	}
	@XmlElement(name="Location_X")
	public String getLocation_X() {
		return location_X;
	}
	public void setLocation_X(String location_X) {
		this.location_X = location_X;
	}
	@XmlElement(name="Location_Y")
	public String getLocation_Y() {
		return location_Y;
	}
	public void setLocation_Y(String location_Y) {
		this.location_Y = location_Y;
	}
	@XmlElement(name="Scale")
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	@XmlElement(name="Label")
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	@XmlElement(name="Title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@XmlElement(name="Description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@XmlElement(name="Url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@XmlElement(name="Recognition")
	public String getRecognition() {
		return recognition;
	}
	public void setRecognition(String recognition) {
		this.recognition = recognition;
	}
	@XmlElement(name="Event")
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	@XmlElement(name="EventKey")
	public String getEventKey() {
		return eventKey;
	}
	public void setEventKey(String eventKey) {
		this.eventKey = eventKey;
	}
	@XmlElement(name="Ticket")
	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	@XmlElement(name="Latitude")
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	@XmlElement(name="Longitude")
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	@XmlElement(name="Precision")
	public String getPrecision() {
		return precision;
	}
	public void setPrecision(String precision) {
		this.precision = precision;
	}
	
	@XmlElement(name="MusicURL")
	public String getMusicURL() {
		return musicURL;
	}
	public void setMusicURL(String musicURL) {
		this.musicURL = musicURL;
	}
	@XmlElement(name="HQMusicUrl")
	public String getHQMusicUrl() {
		return HQMusicUrl;
	}
	public void setHQMusicUrl(String hQMusicUrl) {
		HQMusicUrl = hQMusicUrl;
	}
	@XmlElement(name="ArticleCount")
	public String getArticleCount() {
		return articleCount;
	}
	public void setArticleCount(String articleCount) {
		this.articleCount = articleCount;
	}
	@XmlElement(name="Articles")
	public String getArticles() {
		return articles;
	}
	public void setArticles(String articles) {
		this.articles = articles;
	}
	@Override
	public String toString() {
		return "WXMessage [toUserName=" + toUserName + ", fromUserName="
				+ fromUserName + ", createTime=" + createTime + ", msgType="
				+ msgType + ", msgId=" + msgId + ", content=" + content
				+ ", picUrl=" + picUrl + ", mediaId=" + mediaId + ", format="
				+ format + ", thumbMediaId=" + thumbMediaId + ", location_X="
				+ location_X + ", location_Y=" + location_Y + ", scale="
				+ scale + ", label=" + label + ", title=" + title
				+ ", description=" + description + ", url=" + url
				+ ", recognition=" + recognition + ", event=" + event
				+ ", eventKey=" + eventKey + ", ticket=" + ticket
				+ ", latitude=" + latitude + ", longitude=" + longitude
				+ ", precision=" + precision + "]";
	}
	
	
}
