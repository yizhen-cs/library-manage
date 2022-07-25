package com.yx.dao;

import com.yx.po.ReaderInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReaderInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated
     */
    int insert(ReaderInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated
     */
    int insertSelective(ReaderInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated
     */
    ReaderInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ReaderInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ReaderInfo record);

    /**
     * 查询所有记录信息
     */
    List<ReaderInfo> queryAllReaderInfo(ReaderInfo readerInfo);

    /**
     * 根据用户名和密码查询用户信息
     */
    ReaderInfo queryUserInfoByNameAndPassword(@Param("username") String username, @Param("password") String password);
}