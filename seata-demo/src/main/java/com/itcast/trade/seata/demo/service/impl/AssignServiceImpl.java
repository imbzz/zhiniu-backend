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

package com.itcast.trade.seata.demo.service.impl;

import com.itcast.trade.seata.demo.entity.AssetAssign;
import com.itcast.trade.seata.demo.repository.AssignRepository;
import com.itcast.trade.seata.demo.service.IAssetService;
import com.itcast.trade.seata.demo.service.IAssignService;
import io.seata.core.context.RootContext;
import io.seata.spring.annotation.GlobalTransactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

/**
 * The type Assign service.
 */
@Service
public class AssignServiceImpl implements IAssignService {
	private static final Logger LOGGER = LoggerFactory.getLogger(AssignServiceImpl.class);

	@Autowired
	private AssignRepository assignRepository;

	@Autowired
    private IAssetService assetService;

	@Override
	@Transactional
	@GlobalTransactional
	public AssetAssign increaseAmount(String id) {
	    // 1. 修改状态
		LOGGER.info("Assign Service Begin ... xid: " + RootContext.getXID() + "\n");
		AssetAssign assetAssign = assignRepository.findById(id).get();
		assetAssign.setStatus("2");
		assignRepository.save(assetAssign);

		// remote call asset service
        // 2. 增加数量接口 (模拟远程调用)
		assetService.increase();
		return assetAssign;
	}

}
