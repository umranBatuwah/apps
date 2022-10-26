package com.synectiks.asset.business.service;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import com.google.gson.Gson;
import com.synectiks.asset.response.SlaJsonResponse;

@Converter(autoApply = true)
public class SlaJsonConverter implements AttributeConverter<SlaJsonResponse, String> {

  private final static Gson GSON = new Gson();

  @Override
  public String convertToDatabaseColumn(SlaJsonResponse mjo) {
    return GSON.toJson(mjo);
  }

  @Override
  public SlaJsonResponse convertToEntityAttribute(String dbData) {
    return GSON.fromJson(dbData, SlaJsonResponse.class);
  }
}