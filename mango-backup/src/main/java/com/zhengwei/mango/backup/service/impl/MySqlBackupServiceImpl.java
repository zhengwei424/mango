package com.zhengwei.mango.backup.service.impl;

import com.zhengwei.mango.backup.service.MySqlBackupService;
import com.zhengwei.mango.backup.util.MySqlBackupRestoreUtils;
import org.springframework.stereotype.Service;

@Service
public class MySqlBackupServiceImpl implements MySqlBackupService {

    @Override
    public boolean backup(String host, String userName, String password, String backupFolderPath, String fileName,
                          String database) throws Exception {
        return MySqlBackupRestoreUtils.backup(host, userName, password, backupFolderPath, fileName, database);
    }

    @Override
    public boolean restore(String restoreFilePath, String host, String userName, String password, String database)
            throws Exception {
        return MySqlBackupRestoreUtils.restore(restoreFilePath, host, userName, password, database);
    }

}

