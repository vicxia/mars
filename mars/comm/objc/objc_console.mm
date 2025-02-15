
// Tencent is pleased to support the open source community by making Mars available.
// Copyright (C) 2016 THL A29 Limited, a Tencent company. All rights reserved.

// Licensed under the MIT License (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://opensource.org/licenses/MIT

// Unless required by applicable law or agreed to in writing, software distributed under the License is
// distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions and
// limitations under the License.

#import <Foundation/Foundation.h>
#include "comm/xlogger/xlogger.h"
#include "comm/xlogger/loginfo_extract.h"
#import "comm/objc/scope_autoreleasepool.h"

namespace mars{
namespace xlog{

void ConsoleLog(const XLoggerInfo* _info, const char* _log)
{
    SCOPE_POOL();

    if (NULL==_info || NULL==_log) return;
    
    static const char* levelStrings[] = {
        "V",
        "C",
        "D",  // debug
        "I",  // info
        "W",  // warn
        "E",  // error
        "F"  // fatal
    };
    
    const char* strFuncName  = NULL == _info->func_name ? "" : _info->func_name;
    const char* file_name = ExtractFileName(_info->filename);
    
    printf("[%s][%s][%s:%d, %s][%s\n", levelStrings[_info->level], NULL == _info->tag ? "" : _info->tag, file_name, _info->line, strFuncName, _log);
}

}//xlog
}//mars
