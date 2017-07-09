package com.example.enums;

/**
 * Created by Administrator on 2017/5/4 0004.
 */
public enum ContentTypeEnum {
    IMAGE_JPEG("image/jpeg", ".jpg"),
    IMAGE_PNG("image/png", ".png"),
    IMAGE_GIF("image/gif", ".gif"),
    IMAGE_BMP("image/bmp", ".bmp"),
    VIDEO_MP4("video/mp4", ".mp4"),
    APPLICATION_MSWORD("application/msword", ".doc"),
    APPLICATION_VND_MS_EXCEL("application/vnd.ms-excel", ".xls"),
    APPLICATION_VND_MS_POWERPOINT("application/vnd.ms-powerpoint", ".ppt"),
    APPLICATION_VND_OPENXMLFORMATS_OFFICEDOCUEMNT_WORDPROCESSINGML_DOCUMENT("application/vnd.openxmlformats-officedocument.wordprocessingml.document", ".docx"),
    APPLICATION_VND_OPENXMLFORMATS_OFFICEDOCUEMNT_SPREADSHEETML_SHEET("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", ".xlsx"),
    APPLICATION_VND_OPENXMLFORMATS_OFFICEDOCUEMNT_PRESENTATIONML_PRESENTATION("application/vnd.openxmlformats-officedocument.presentationml.presentation", ".pptx");

    private String mimeType;
    private String extension;

    public void setMimeType(String mimeType) {
        this.mimeType = mimeType;
    }

    public String getMimeType() {
        return mimeType;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public String getExtension() {
        return extension;
    }

    private ContentTypeEnum(String mimeType, String extension) {
        this.mimeType = mimeType;
        this.extension = extension;
    }

    public static ContentTypeEnum getContentType(String mimeType) {
        for (ContentTypeEnum contentTypeEnum : ContentTypeEnum.values()) {
            if (contentTypeEnum.getMimeType().equals(mimeType)) {
                return contentTypeEnum;
            }
        }
        return null;
    }
}
