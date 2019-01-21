package com.work.drdo.domain.questionnaire;

public class MetaData {
	private Integer reportMetadataId;
	private String columnName;
    private String dataType;
    private String tooltip;
    private String formula;
    private String variableName;
    public Integer getReportMetadataId() {
        return reportMetadataId;
    }

    public void setReportMetadataId(Integer reportMetadataId) {
        this.reportMetadataId = reportMetadataId;
    }
    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }
    public String getVariableName() {
        return variableName;
    }

    public void setVariableName(String variableName) {
        this.variableName = variableName;
    }
    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getTooltip() {
        return tooltip;
    }

    public void setTooltip(String tooltip) {
        this.tooltip = tooltip;
    }

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }
    @Override
    public String toString() {
        return "MetaData{" +"columnName=" + columnName + ", dataType=" + dataType + ", tooltip=" + tooltip + ", formula=" + formula + '}';
    }
}
