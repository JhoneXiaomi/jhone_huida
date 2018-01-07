package com.scinter.www.model;

import com.scinter.www.util.Page;
import java.util.ArrayList;
import java.util.List;

public class TicketExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Page page;

    public TicketExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setPage(Page page) {
        this.page=page;
    }

    public Page getPage() {
        return page;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andTidIsNull() {
            addCriterion("tid is null");
            return (Criteria) this;
        }

        public Criteria andTidIsNotNull() {
            addCriterion("tid is not null");
            return (Criteria) this;
        }

        public Criteria andTidEqualTo(String value) {
            addCriterion("tid =", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotEqualTo(String value) {
            addCriterion("tid <>", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidGreaterThan(String value) {
            addCriterion("tid >", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidGreaterThanOrEqualTo(String value) {
            addCriterion("tid >=", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidLessThan(String value) {
            addCriterion("tid <", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidLessThanOrEqualTo(String value) {
            addCriterion("tid <=", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidLike(String value) {
            addCriterion("tid like", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotLike(String value) {
            addCriterion("tid not like", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidIn(List<String> values) {
            addCriterion("tid in", values, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotIn(List<String> values) {
            addCriterion("tid not in", values, "tid");
            return (Criteria) this;
        }

        public Criteria andTidBetween(String value1, String value2) {
            addCriterion("tid between", value1, value2, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotBetween(String value1, String value2) {
            addCriterion("tid not between", value1, value2, "tid");
            return (Criteria) this;
        }

        public Criteria andTicketIsNull() {
            addCriterion("ticket is null");
            return (Criteria) this;
        }

        public Criteria andTicketIsNotNull() {
            addCriterion("ticket is not null");
            return (Criteria) this;
        }

        public Criteria andTicketEqualTo(String value) {
            addCriterion("ticket =", value, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketNotEqualTo(String value) {
            addCriterion("ticket <>", value, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketGreaterThan(String value) {
            addCriterion("ticket >", value, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketGreaterThanOrEqualTo(String value) {
            addCriterion("ticket >=", value, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketLessThan(String value) {
            addCriterion("ticket <", value, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketLessThanOrEqualTo(String value) {
            addCriterion("ticket <=", value, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketLike(String value) {
            addCriterion("ticket like", value, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketNotLike(String value) {
            addCriterion("ticket not like", value, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketIn(List<String> values) {
            addCriterion("ticket in", values, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketNotIn(List<String> values) {
            addCriterion("ticket not in", values, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketBetween(String value1, String value2) {
            addCriterion("ticket between", value1, value2, "ticket");
            return (Criteria) this;
        }

        public Criteria andTicketNotBetween(String value1, String value2) {
            addCriterion("ticket not between", value1, value2, "ticket");
            return (Criteria) this;
        }

        public Criteria andErrcodeIsNull() {
            addCriterion("errcode is null");
            return (Criteria) this;
        }

        public Criteria andErrcodeIsNotNull() {
            addCriterion("errcode is not null");
            return (Criteria) this;
        }

        public Criteria andErrcodeEqualTo(String value) {
            addCriterion("errcode =", value, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeNotEqualTo(String value) {
            addCriterion("errcode <>", value, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeGreaterThan(String value) {
            addCriterion("errcode >", value, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeGreaterThanOrEqualTo(String value) {
            addCriterion("errcode >=", value, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeLessThan(String value) {
            addCriterion("errcode <", value, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeLessThanOrEqualTo(String value) {
            addCriterion("errcode <=", value, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeLike(String value) {
            addCriterion("errcode like", value, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeNotLike(String value) {
            addCriterion("errcode not like", value, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeIn(List<String> values) {
            addCriterion("errcode in", values, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeNotIn(List<String> values) {
            addCriterion("errcode not in", values, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeBetween(String value1, String value2) {
            addCriterion("errcode between", value1, value2, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrcodeNotBetween(String value1, String value2) {
            addCriterion("errcode not between", value1, value2, "errcode");
            return (Criteria) this;
        }

        public Criteria andErrmsgIsNull() {
            addCriterion("errmsg is null");
            return (Criteria) this;
        }

        public Criteria andErrmsgIsNotNull() {
            addCriterion("errmsg is not null");
            return (Criteria) this;
        }

        public Criteria andErrmsgEqualTo(String value) {
            addCriterion("errmsg =", value, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgNotEqualTo(String value) {
            addCriterion("errmsg <>", value, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgGreaterThan(String value) {
            addCriterion("errmsg >", value, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgGreaterThanOrEqualTo(String value) {
            addCriterion("errmsg >=", value, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgLessThan(String value) {
            addCriterion("errmsg <", value, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgLessThanOrEqualTo(String value) {
            addCriterion("errmsg <=", value, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgLike(String value) {
            addCriterion("errmsg like", value, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgNotLike(String value) {
            addCriterion("errmsg not like", value, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgIn(List<String> values) {
            addCriterion("errmsg in", values, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgNotIn(List<String> values) {
            addCriterion("errmsg not in", values, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgBetween(String value1, String value2) {
            addCriterion("errmsg between", value1, value2, "errmsg");
            return (Criteria) this;
        }

        public Criteria andErrmsgNotBetween(String value1, String value2) {
            addCriterion("errmsg not between", value1, value2, "errmsg");
            return (Criteria) this;
        }

        public Criteria andExpiresInIsNull() {
            addCriterion("expires_in is null");
            return (Criteria) this;
        }

        public Criteria andExpiresInIsNotNull() {
            addCriterion("expires_in is not null");
            return (Criteria) this;
        }

        public Criteria andExpiresInEqualTo(String value) {
            addCriterion("expires_in =", value, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInNotEqualTo(String value) {
            addCriterion("expires_in <>", value, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInGreaterThan(String value) {
            addCriterion("expires_in >", value, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInGreaterThanOrEqualTo(String value) {
            addCriterion("expires_in >=", value, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInLessThan(String value) {
            addCriterion("expires_in <", value, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInLessThanOrEqualTo(String value) {
            addCriterion("expires_in <=", value, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInLike(String value) {
            addCriterion("expires_in like", value, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInNotLike(String value) {
            addCriterion("expires_in not like", value, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInIn(List<String> values) {
            addCriterion("expires_in in", values, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInNotIn(List<String> values) {
            addCriterion("expires_in not in", values, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInBetween(String value1, String value2) {
            addCriterion("expires_in between", value1, value2, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andExpiresInNotBetween(String value1, String value2) {
            addCriterion("expires_in not between", value1, value2, "expiresIn");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeIsNull() {
            addCriterion("acquiretime is null");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeIsNotNull() {
            addCriterion("acquiretime is not null");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeEqualTo(String value) {
            addCriterion("acquiretime =", value, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeNotEqualTo(String value) {
            addCriterion("acquiretime <>", value, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeGreaterThan(String value) {
            addCriterion("acquiretime >", value, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeGreaterThanOrEqualTo(String value) {
            addCriterion("acquiretime >=", value, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeLessThan(String value) {
            addCriterion("acquiretime <", value, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeLessThanOrEqualTo(String value) {
            addCriterion("acquiretime <=", value, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeLike(String value) {
            addCriterion("acquiretime like", value, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeNotLike(String value) {
            addCriterion("acquiretime not like", value, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeIn(List<String> values) {
            addCriterion("acquiretime in", values, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeNotIn(List<String> values) {
            addCriterion("acquiretime not in", values, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeBetween(String value1, String value2) {
            addCriterion("acquiretime between", value1, value2, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andAcquiretimeNotBetween(String value1, String value2) {
            addCriterion("acquiretime not between", value1, value2, "acquiretime");
            return (Criteria) this;
        }

        public Criteria andNoncestrIsNull() {
            addCriterion("noncestr is null");
            return (Criteria) this;
        }

        public Criteria andNoncestrIsNotNull() {
            addCriterion("noncestr is not null");
            return (Criteria) this;
        }

        public Criteria andNoncestrEqualTo(String value) {
            addCriterion("noncestr =", value, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrNotEqualTo(String value) {
            addCriterion("noncestr <>", value, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrGreaterThan(String value) {
            addCriterion("noncestr >", value, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrGreaterThanOrEqualTo(String value) {
            addCriterion("noncestr >=", value, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrLessThan(String value) {
            addCriterion("noncestr <", value, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrLessThanOrEqualTo(String value) {
            addCriterion("noncestr <=", value, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrLike(String value) {
            addCriterion("noncestr like", value, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrNotLike(String value) {
            addCriterion("noncestr not like", value, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrIn(List<String> values) {
            addCriterion("noncestr in", values, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrNotIn(List<String> values) {
            addCriterion("noncestr not in", values, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrBetween(String value1, String value2) {
            addCriterion("noncestr between", value1, value2, "noncestr");
            return (Criteria) this;
        }

        public Criteria andNoncestrNotBetween(String value1, String value2) {
            addCriterion("noncestr not between", value1, value2, "noncestr");
            return (Criteria) this;
        }

        public Criteria andTimestampIsNull() {
            addCriterion("timestamp is null");
            return (Criteria) this;
        }

        public Criteria andTimestampIsNotNull() {
            addCriterion("timestamp is not null");
            return (Criteria) this;
        }

        public Criteria andTimestampEqualTo(String value) {
            addCriterion("timestamp =", value, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampNotEqualTo(String value) {
            addCriterion("timestamp <>", value, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampGreaterThan(String value) {
            addCriterion("timestamp >", value, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampGreaterThanOrEqualTo(String value) {
            addCriterion("timestamp >=", value, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampLessThan(String value) {
            addCriterion("timestamp <", value, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampLessThanOrEqualTo(String value) {
            addCriterion("timestamp <=", value, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampLike(String value) {
            addCriterion("timestamp like", value, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampNotLike(String value) {
            addCriterion("timestamp not like", value, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampIn(List<String> values) {
            addCriterion("timestamp in", values, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampNotIn(List<String> values) {
            addCriterion("timestamp not in", values, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampBetween(String value1, String value2) {
            addCriterion("timestamp between", value1, value2, "timestamp");
            return (Criteria) this;
        }

        public Criteria andTimestampNotBetween(String value1, String value2) {
            addCriterion("timestamp not between", value1, value2, "timestamp");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }

        public Criteria andTidLikeInsensitive(String value) {
            addCriterion("upper(tid) like", value.toUpperCase(), "tid");
            return this;
        }

        public Criteria andTicketLikeInsensitive(String value) {
            addCriterion("upper(ticket) like", value.toUpperCase(), "ticket");
            return this;
        }

        public Criteria andErrcodeLikeInsensitive(String value) {
            addCriterion("upper(errcode) like", value.toUpperCase(), "errcode");
            return this;
        }

        public Criteria andErrmsgLikeInsensitive(String value) {
            addCriterion("upper(errmsg) like", value.toUpperCase(), "errmsg");
            return this;
        }

        public Criteria andExpiresInLikeInsensitive(String value) {
            addCriterion("upper(expires_in) like", value.toUpperCase(), "expiresIn");
            return this;
        }

        public Criteria andAcquiretimeLikeInsensitive(String value) {
            addCriterion("upper(acquiretime) like", value.toUpperCase(), "acquiretime");
            return this;
        }

        public Criteria andNoncestrLikeInsensitive(String value) {
            addCriterion("upper(noncestr) like", value.toUpperCase(), "noncestr");
            return this;
        }

        public Criteria andTimestampLikeInsensitive(String value) {
            addCriterion("upper(timestamp) like", value.toUpperCase(), "timestamp");
            return this;
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}