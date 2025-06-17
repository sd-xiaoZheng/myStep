package org.zaohu.common.entity;

import lombok.Data;

@Data
public class FileWrapper {
    private String filename;
    private String contentType;
    private byte[] content;
}