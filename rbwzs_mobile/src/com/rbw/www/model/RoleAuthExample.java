package com.rbw.www.model;

import com.rbw.www.util.Page;
import java.util.ArrayList;
import java.util.List;

public class RoleAuthExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Page page;

    public RoleAuthExample() {
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

        public Criteria andAuthIdIsNull() {
            addCriterion("auth_id is null");
            return (Criteria) this;
        }

        public Criteria andAuthIdIsNotNull() {
            addCriterion("auth_id is not null");
            return (Criteria) this;
        }

        public Criteria andAuthIdEqualTo(Integer value) {
            addCriterion("auth_id =", value, "authId");
            return (Criteria) this;
        }

        public Criteria andAuthIdNotEqualTo(Integer value) {
            addCriterion("auth_id <>", value, "authId");
            return (Criteria) this;
        }

        public Criteria andAuthIdGreaterThan(Integer value) {
            addCriterion("auth_id >", value, "authId");
            return (Criteria) this;
        }

        public Criteria andAuthIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("auth_id >=", value, "authId");
            return (Criteria) this;
        }

        public Criteria andAuthIdLessThan(Integer value) {
            addCriterion("auth_id <", value, "authId");
            return (Criteria) this;
        }

        public Criteria andAuthIdLessThanOrEqualTo(Integer value) {
            addCriterion("auth_id <=", value, "authId");
            return (Criteria) this;
        }

        public Criteria andAuthIdIn(List<Integer> values) {
            addCriterion("auth_id in", values, "authId");
            return (Criteria) this;
        }

        public Criteria andAuthIdNotIn(List<Integer> values) {
            addCriterion("auth_id not in", values, "authId");
            return (Criteria) this;
        }

        public Criteria andAuthIdBetween(Integer value1, Integer value2) {
            addCriterion("auth_id between", value1, value2, "authId");
            return (Criteria) this;
        }

        public Criteria andAuthIdNotBetween(Integer value1, Integer value2) {
            addCriterion("auth_id not between", value1, value2, "authId");
            return (Criteria) this;
        }

        public Criteria andRoleIdIsNull() {
            addCriterion("role_id is null");
            return (Criteria) this;
        }

        public Criteria andRoleIdIsNotNull() {
            addCriterion("role_id is not null");
            return (Criteria) this;
        }

        public Criteria andRoleIdEqualTo(Integer value) {
            addCriterion("role_id =", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdNotEqualTo(Integer value) {
            addCriterion("role_id <>", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdGreaterThan(Integer value) {
            addCriterion("role_id >", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("role_id >=", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdLessThan(Integer value) {
            addCriterion("role_id <", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdLessThanOrEqualTo(Integer value) {
            addCriterion("role_id <=", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdIn(List<Integer> values) {
            addCriterion("role_id in", values, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdNotIn(List<Integer> values) {
            addCriterion("role_id not in", values, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdBetween(Integer value1, Integer value2) {
            addCriterion("role_id between", value1, value2, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdNotBetween(Integer value1, Integer value2) {
            addCriterion("role_id not between", value1, value2, "roleId");
            return (Criteria) this;
        }

        public Criteria andSypzIsNull() {
            addCriterion("sypz is null");
            return (Criteria) this;
        }

        public Criteria andSypzIsNotNull() {
            addCriterion("sypz is not null");
            return (Criteria) this;
        }

        public Criteria andSypzEqualTo(Integer value) {
            addCriterion("sypz =", value, "sypz");
            return (Criteria) this;
        }

        public Criteria andSypzNotEqualTo(Integer value) {
            addCriterion("sypz <>", value, "sypz");
            return (Criteria) this;
        }

        public Criteria andSypzGreaterThan(Integer value) {
            addCriterion("sypz >", value, "sypz");
            return (Criteria) this;
        }

        public Criteria andSypzGreaterThanOrEqualTo(Integer value) {
            addCriterion("sypz >=", value, "sypz");
            return (Criteria) this;
        }

        public Criteria andSypzLessThan(Integer value) {
            addCriterion("sypz <", value, "sypz");
            return (Criteria) this;
        }

        public Criteria andSypzLessThanOrEqualTo(Integer value) {
            addCriterion("sypz <=", value, "sypz");
            return (Criteria) this;
        }

        public Criteria andSypzIn(List<Integer> values) {
            addCriterion("sypz in", values, "sypz");
            return (Criteria) this;
        }

        public Criteria andSypzNotIn(List<Integer> values) {
            addCriterion("sypz not in", values, "sypz");
            return (Criteria) this;
        }

        public Criteria andSypzBetween(Integer value1, Integer value2) {
            addCriterion("sypz between", value1, value2, "sypz");
            return (Criteria) this;
        }

        public Criteria andSypzNotBetween(Integer value1, Integer value2) {
            addCriterion("sypz not between", value1, value2, "sypz");
            return (Criteria) this;
        }

        public Criteria andZxalIsNull() {
            addCriterion("zxal is null");
            return (Criteria) this;
        }

        public Criteria andZxalIsNotNull() {
            addCriterion("zxal is not null");
            return (Criteria) this;
        }

        public Criteria andZxalEqualTo(Integer value) {
            addCriterion("zxal =", value, "zxal");
            return (Criteria) this;
        }

        public Criteria andZxalNotEqualTo(Integer value) {
            addCriterion("zxal <>", value, "zxal");
            return (Criteria) this;
        }

        public Criteria andZxalGreaterThan(Integer value) {
            addCriterion("zxal >", value, "zxal");
            return (Criteria) this;
        }

        public Criteria andZxalGreaterThanOrEqualTo(Integer value) {
            addCriterion("zxal >=", value, "zxal");
            return (Criteria) this;
        }

        public Criteria andZxalLessThan(Integer value) {
            addCriterion("zxal <", value, "zxal");
            return (Criteria) this;
        }

        public Criteria andZxalLessThanOrEqualTo(Integer value) {
            addCriterion("zxal <=", value, "zxal");
            return (Criteria) this;
        }

        public Criteria andZxalIn(List<Integer> values) {
            addCriterion("zxal in", values, "zxal");
            return (Criteria) this;
        }

        public Criteria andZxalNotIn(List<Integer> values) {
            addCriterion("zxal not in", values, "zxal");
            return (Criteria) this;
        }

        public Criteria andZxalBetween(Integer value1, Integer value2) {
            addCriterion("zxal between", value1, value2, "zxal");
            return (Criteria) this;
        }

        public Criteria andZxalNotBetween(Integer value1, Integer value2) {
            addCriterion("zxal not between", value1, value2, "zxal");
            return (Criteria) this;
        }

        public Criteria andSjtdIsNull() {
            addCriterion("sjtd is null");
            return (Criteria) this;
        }

        public Criteria andSjtdIsNotNull() {
            addCriterion("sjtd is not null");
            return (Criteria) this;
        }

        public Criteria andSjtdEqualTo(Integer value) {
            addCriterion("sjtd =", value, "sjtd");
            return (Criteria) this;
        }

        public Criteria andSjtdNotEqualTo(Integer value) {
            addCriterion("sjtd <>", value, "sjtd");
            return (Criteria) this;
        }

        public Criteria andSjtdGreaterThan(Integer value) {
            addCriterion("sjtd >", value, "sjtd");
            return (Criteria) this;
        }

        public Criteria andSjtdGreaterThanOrEqualTo(Integer value) {
            addCriterion("sjtd >=", value, "sjtd");
            return (Criteria) this;
        }

        public Criteria andSjtdLessThan(Integer value) {
            addCriterion("sjtd <", value, "sjtd");
            return (Criteria) this;
        }

        public Criteria andSjtdLessThanOrEqualTo(Integer value) {
            addCriterion("sjtd <=", value, "sjtd");
            return (Criteria) this;
        }

        public Criteria andSjtdIn(List<Integer> values) {
            addCriterion("sjtd in", values, "sjtd");
            return (Criteria) this;
        }

        public Criteria andSjtdNotIn(List<Integer> values) {
            addCriterion("sjtd not in", values, "sjtd");
            return (Criteria) this;
        }

        public Criteria andSjtdBetween(Integer value1, Integer value2) {
            addCriterion("sjtd between", value1, value2, "sjtd");
            return (Criteria) this;
        }

        public Criteria andSjtdNotBetween(Integer value1, Integer value2) {
            addCriterion("sjtd not between", value1, value2, "sjtd");
            return (Criteria) this;
        }

        public Criteria andLpxxIsNull() {
            addCriterion("lpxx is null");
            return (Criteria) this;
        }

        public Criteria andLpxxIsNotNull() {
            addCriterion("lpxx is not null");
            return (Criteria) this;
        }

        public Criteria andLpxxEqualTo(Integer value) {
            addCriterion("lpxx =", value, "lpxx");
            return (Criteria) this;
        }

        public Criteria andLpxxNotEqualTo(Integer value) {
            addCriterion("lpxx <>", value, "lpxx");
            return (Criteria) this;
        }

        public Criteria andLpxxGreaterThan(Integer value) {
            addCriterion("lpxx >", value, "lpxx");
            return (Criteria) this;
        }

        public Criteria andLpxxGreaterThanOrEqualTo(Integer value) {
            addCriterion("lpxx >=", value, "lpxx");
            return (Criteria) this;
        }

        public Criteria andLpxxLessThan(Integer value) {
            addCriterion("lpxx <", value, "lpxx");
            return (Criteria) this;
        }

        public Criteria andLpxxLessThanOrEqualTo(Integer value) {
            addCriterion("lpxx <=", value, "lpxx");
            return (Criteria) this;
        }

        public Criteria andLpxxIn(List<Integer> values) {
            addCriterion("lpxx in", values, "lpxx");
            return (Criteria) this;
        }

        public Criteria andLpxxNotIn(List<Integer> values) {
            addCriterion("lpxx not in", values, "lpxx");
            return (Criteria) this;
        }

        public Criteria andLpxxBetween(Integer value1, Integer value2) {
            addCriterion("lpxx between", value1, value2, "lpxx");
            return (Criteria) this;
        }

        public Criteria andLpxxNotBetween(Integer value1, Integer value2) {
            addCriterion("lpxx not between", value1, value2, "lpxx");
            return (Criteria) this;
        }

        public Criteria andZjgdIsNull() {
            addCriterion("zjgd is null");
            return (Criteria) this;
        }

        public Criteria andZjgdIsNotNull() {
            addCriterion("zjgd is not null");
            return (Criteria) this;
        }

        public Criteria andZjgdEqualTo(Integer value) {
            addCriterion("zjgd =", value, "zjgd");
            return (Criteria) this;
        }

        public Criteria andZjgdNotEqualTo(Integer value) {
            addCriterion("zjgd <>", value, "zjgd");
            return (Criteria) this;
        }

        public Criteria andZjgdGreaterThan(Integer value) {
            addCriterion("zjgd >", value, "zjgd");
            return (Criteria) this;
        }

        public Criteria andZjgdGreaterThanOrEqualTo(Integer value) {
            addCriterion("zjgd >=", value, "zjgd");
            return (Criteria) this;
        }

        public Criteria andZjgdLessThan(Integer value) {
            addCriterion("zjgd <", value, "zjgd");
            return (Criteria) this;
        }

        public Criteria andZjgdLessThanOrEqualTo(Integer value) {
            addCriterion("zjgd <=", value, "zjgd");
            return (Criteria) this;
        }

        public Criteria andZjgdIn(List<Integer> values) {
            addCriterion("zjgd in", values, "zjgd");
            return (Criteria) this;
        }

        public Criteria andZjgdNotIn(List<Integer> values) {
            addCriterion("zjgd not in", values, "zjgd");
            return (Criteria) this;
        }

        public Criteria andZjgdBetween(Integer value1, Integer value2) {
            addCriterion("zjgd between", value1, value2, "zjgd");
            return (Criteria) this;
        }

        public Criteria andZjgdNotBetween(Integer value1, Integer value2) {
            addCriterion("zjgd not between", value1, value2, "zjgd");
            return (Criteria) this;
        }

        public Criteria andHxdpIsNull() {
            addCriterion("hxdp is null");
            return (Criteria) this;
        }

        public Criteria andHxdpIsNotNull() {
            addCriterion("hxdp is not null");
            return (Criteria) this;
        }

        public Criteria andHxdpEqualTo(Integer value) {
            addCriterion("hxdp =", value, "hxdp");
            return (Criteria) this;
        }

        public Criteria andHxdpNotEqualTo(Integer value) {
            addCriterion("hxdp <>", value, "hxdp");
            return (Criteria) this;
        }

        public Criteria andHxdpGreaterThan(Integer value) {
            addCriterion("hxdp >", value, "hxdp");
            return (Criteria) this;
        }

        public Criteria andHxdpGreaterThanOrEqualTo(Integer value) {
            addCriterion("hxdp >=", value, "hxdp");
            return (Criteria) this;
        }

        public Criteria andHxdpLessThan(Integer value) {
            addCriterion("hxdp <", value, "hxdp");
            return (Criteria) this;
        }

        public Criteria andHxdpLessThanOrEqualTo(Integer value) {
            addCriterion("hxdp <=", value, "hxdp");
            return (Criteria) this;
        }

        public Criteria andHxdpIn(List<Integer> values) {
            addCriterion("hxdp in", values, "hxdp");
            return (Criteria) this;
        }

        public Criteria andHxdpNotIn(List<Integer> values) {
            addCriterion("hxdp not in", values, "hxdp");
            return (Criteria) this;
        }

        public Criteria andHxdpBetween(Integer value1, Integer value2) {
            addCriterion("hxdp between", value1, value2, "hxdp");
            return (Criteria) this;
        }

        public Criteria andHxdpNotBetween(Integer value1, Integer value2) {
            addCriterion("hxdp not between", value1, value2, "hxdp");
            return (Criteria) this;
        }

        public Criteria andZxzxIsNull() {
            addCriterion("zxzx is null");
            return (Criteria) this;
        }

        public Criteria andZxzxIsNotNull() {
            addCriterion("zxzx is not null");
            return (Criteria) this;
        }

        public Criteria andZxzxEqualTo(Integer value) {
            addCriterion("zxzx =", value, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxzxNotEqualTo(Integer value) {
            addCriterion("zxzx <>", value, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxzxGreaterThan(Integer value) {
            addCriterion("zxzx >", value, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxzxGreaterThanOrEqualTo(Integer value) {
            addCriterion("zxzx >=", value, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxzxLessThan(Integer value) {
            addCriterion("zxzx <", value, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxzxLessThanOrEqualTo(Integer value) {
            addCriterion("zxzx <=", value, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxzxIn(List<Integer> values) {
            addCriterion("zxzx in", values, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxzxNotIn(List<Integer> values) {
            addCriterion("zxzx not in", values, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxzxBetween(Integer value1, Integer value2) {
            addCriterion("zxzx between", value1, value2, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxzxNotBetween(Integer value1, Integer value2) {
            addCriterion("zxzx not between", value1, value2, "zxzx");
            return (Criteria) this;
        }

        public Criteria andZxddIsNull() {
            addCriterion("zxdd is null");
            return (Criteria) this;
        }

        public Criteria andZxddIsNotNull() {
            addCriterion("zxdd is not null");
            return (Criteria) this;
        }

        public Criteria andZxddEqualTo(Integer value) {
            addCriterion("zxdd =", value, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxddNotEqualTo(Integer value) {
            addCriterion("zxdd <>", value, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxddGreaterThan(Integer value) {
            addCriterion("zxdd >", value, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxddGreaterThanOrEqualTo(Integer value) {
            addCriterion("zxdd >=", value, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxddLessThan(Integer value) {
            addCriterion("zxdd <", value, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxddLessThanOrEqualTo(Integer value) {
            addCriterion("zxdd <=", value, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxddIn(List<Integer> values) {
            addCriterion("zxdd in", values, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxddNotIn(List<Integer> values) {
            addCriterion("zxdd not in", values, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxddBetween(Integer value1, Integer value2) {
            addCriterion("zxdd between", value1, value2, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxddNotBetween(Integer value1, Integer value2) {
            addCriterion("zxdd not between", value1, value2, "zxdd");
            return (Criteria) this;
        }

        public Criteria andZxbxIsNull() {
            addCriterion("zxbx is null");
            return (Criteria) this;
        }

        public Criteria andZxbxIsNotNull() {
            addCriterion("zxbx is not null");
            return (Criteria) this;
        }

        public Criteria andZxbxEqualTo(Integer value) {
            addCriterion("zxbx =", value, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxbxNotEqualTo(Integer value) {
            addCriterion("zxbx <>", value, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxbxGreaterThan(Integer value) {
            addCriterion("zxbx >", value, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxbxGreaterThanOrEqualTo(Integer value) {
            addCriterion("zxbx >=", value, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxbxLessThan(Integer value) {
            addCriterion("zxbx <", value, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxbxLessThanOrEqualTo(Integer value) {
            addCriterion("zxbx <=", value, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxbxIn(List<Integer> values) {
            addCriterion("zxbx in", values, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxbxNotIn(List<Integer> values) {
            addCriterion("zxbx not in", values, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxbxBetween(Integer value1, Integer value2) {
            addCriterion("zxbx between", value1, value2, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxbxNotBetween(Integer value1, Integer value2) {
            addCriterion("zxbx not between", value1, value2, "zxbx");
            return (Criteria) this;
        }

        public Criteria andZxwdIsNull() {
            addCriterion("zxwd is null");
            return (Criteria) this;
        }

        public Criteria andZxwdIsNotNull() {
            addCriterion("zxwd is not null");
            return (Criteria) this;
        }

        public Criteria andZxwdEqualTo(Integer value) {
            addCriterion("zxwd =", value, "zxwd");
            return (Criteria) this;
        }

        public Criteria andZxwdNotEqualTo(Integer value) {
            addCriterion("zxwd <>", value, "zxwd");
            return (Criteria) this;
        }

        public Criteria andZxwdGreaterThan(Integer value) {
            addCriterion("zxwd >", value, "zxwd");
            return (Criteria) this;
        }

        public Criteria andZxwdGreaterThanOrEqualTo(Integer value) {
            addCriterion("zxwd >=", value, "zxwd");
            return (Criteria) this;
        }

        public Criteria andZxwdLessThan(Integer value) {
            addCriterion("zxwd <", value, "zxwd");
            return (Criteria) this;
        }

        public Criteria andZxwdLessThanOrEqualTo(Integer value) {
            addCriterion("zxwd <=", value, "zxwd");
            return (Criteria) this;
        }

        public Criteria andZxwdIn(List<Integer> values) {
            addCriterion("zxwd in", values, "zxwd");
            return (Criteria) this;
        }

        public Criteria andZxwdNotIn(List<Integer> values) {
            addCriterion("zxwd not in", values, "zxwd");
            return (Criteria) this;
        }

        public Criteria andZxwdBetween(Integer value1, Integer value2) {
            addCriterion("zxwd between", value1, value2, "zxwd");
            return (Criteria) this;
        }

        public Criteria andZxwdNotBetween(Integer value1, Integer value2) {
            addCriterion("zxwd not between", value1, value2, "zxwd");
            return (Criteria) this;
        }

        public Criteria andLyplIsNull() {
            addCriterion("lypl is null");
            return (Criteria) this;
        }

        public Criteria andLyplIsNotNull() {
            addCriterion("lypl is not null");
            return (Criteria) this;
        }

        public Criteria andLyplEqualTo(Integer value) {
            addCriterion("lypl =", value, "lypl");
            return (Criteria) this;
        }

        public Criteria andLyplNotEqualTo(Integer value) {
            addCriterion("lypl <>", value, "lypl");
            return (Criteria) this;
        }

        public Criteria andLyplGreaterThan(Integer value) {
            addCriterion("lypl >", value, "lypl");
            return (Criteria) this;
        }

        public Criteria andLyplGreaterThanOrEqualTo(Integer value) {
            addCriterion("lypl >=", value, "lypl");
            return (Criteria) this;
        }

        public Criteria andLyplLessThan(Integer value) {
            addCriterion("lypl <", value, "lypl");
            return (Criteria) this;
        }

        public Criteria andLyplLessThanOrEqualTo(Integer value) {
            addCriterion("lypl <=", value, "lypl");
            return (Criteria) this;
        }

        public Criteria andLyplIn(List<Integer> values) {
            addCriterion("lypl in", values, "lypl");
            return (Criteria) this;
        }

        public Criteria andLyplNotIn(List<Integer> values) {
            addCriterion("lypl not in", values, "lypl");
            return (Criteria) this;
        }

        public Criteria andLyplBetween(Integer value1, Integer value2) {
            addCriterion("lypl between", value1, value2, "lypl");
            return (Criteria) this;
        }

        public Criteria andLyplNotBetween(Integer value1, Integer value2) {
            addCriterion("lypl not between", value1, value2, "lypl");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
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