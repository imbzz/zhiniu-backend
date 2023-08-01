/*
 *  Copyright 1999-2018 Alibaba Group Holding Ltd.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package com.itcast.trade.seata.demo.service;


import com.itcast.trade.seata.demo.entity.AssetAssign;

/**
 * The interface Assign service.
 */
public interface IAssignService {
    /**
     * Increase amount asset assign. 主业务逻辑接口:  修改状态和增加数量的处理
     *
     * @param id the id
     * @return the asset assign
     */
    AssetAssign increaseAmount(String id);
}
