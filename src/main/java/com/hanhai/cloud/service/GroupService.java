package com.hanhai.cloud.service;

import cn.dev33.satoken.stp.StpUtil;
import com.github.pagehelper.PageHelper;
import com.hanhai.cloud.base.BaseService;
import com.hanhai.cloud.entity.Group;
import com.hanhai.cloud.entity.GroupRelationship;
import com.hanhai.cloud.exception.UpdateException;
import com.hanhai.cloud.params.AddGroupParams;
import com.hanhai.cloud.params.AddGroupParams;
import com.hanhai.cloud.params.GroupAddUserParam;
import com.hanhai.cloud.params.UpdGroupParams;
import com.hanhai.cloud.utils.BeanUtils;
import com.hanhai.cloud.vo.GroupVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class GroupService extends BaseService {
    public List<GroupVO> getAllGroup(String groupName){
        List<Group> groups = groupMapper.getByUserIdAndGroupName(StpUtil.getLoginIdAsLong(), groupName);
        List<GroupVO> groupVOList = new ArrayList<>(groups.size());
        for (Group group : groups) {
            groupVOList.add(BeanUtils.convertTo(group,GroupVO.class));
        }
        return groupVOList;

//        return groupMapper.getByUserIdAndGroupName(StpUtil.getLoginIdAsLong(),groupName)
//                .stream()
//                .map(i-> BeanUtils.convertTo(i,GroupVO.class))
//                .collect(Collectors.toList());
    }

    @Transactional
    public void insertGroup(AddGroupParams groupParams) throws UpdateException {
        Group group = new Group()
                .setGroupName(groupParams.getGroupName())
                .setNumberOfPersones(groupParams.getUserList().size())
                .setUserId(StpUtil.getLoginIdAsLong());
        // 插入新群组
        groupMapper.insert(group);

        // 插入 群组与用户联系
        for (Long userId : groupParams.getUserList()) {
            groupRelationshipMapper.insert(new GroupRelationship().setGroupId(group.getGroupId())
                                                                .setUserId(userId));
        }
    }

    public void updGroupName(Group group) {
        groupMapper.updGroupName(group);
    }

    public void delGroup(Long groupId) {
        groupMapper.deleteById(groupId);
    }

    public Group getGroupById(Long groupId){
        return groupMapper.selectById(groupId);
    }

    public Group getGroupByName(String groupName, Long userId) {
        return groupMapper.getGroupByName(groupName, userId);
    }

    public void delPersonNum(Long groupId) {
        groupMapper.delPersonNum(groupId);
    }

    public void addPersonNum(GroupAddUserParam groupAddUserParam) {
        groupMapper.addPersonNum(groupAddUserParam.getGroupId(), groupAddUserParam.getUserIds().length);
    }
}
