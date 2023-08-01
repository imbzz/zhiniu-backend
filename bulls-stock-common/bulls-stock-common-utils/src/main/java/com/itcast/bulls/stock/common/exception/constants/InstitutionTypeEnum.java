package com.itcast.bulls.stock.common.exception.constants;

/**
 *  预置的机构类型
 */
public enum InstitutionTypeEnum {

	GROUPS("GROUPS", "顶层公司", 9999),

	SERVICE_OPERATE("SERVICE_OPERATE", "运营中心", 2),

	COMPANY("COMPANY", "交易商",3),
	;

	private String orgType;
	private String orgTypeName;
	private Integer orgId;

	private InstitutionTypeEnum(String orgType, String orgTypeName,  Integer orgId) {
		this.orgType = orgType;
		this.orgTypeName = orgTypeName;
		this.orgId = orgId;
	}

	public static InstitutionTypeEnum getByCode(String code){
		for(InstitutionTypeEnum ae : InstitutionTypeEnum.values()){
			if(ae.getOrgType().equals(code)){
				return ae;
			}
		}
		return null;
	}

	public String getOrgType() {
		return orgType;
	}

	public String getOrgTypeName() {
		return orgTypeName;
	}

	public Integer getOrgId() {
		return orgId;
	}
}
