//
//  breezr
//  models.rs
//
//  Created by Ngonidzashe Mangudya on 2025/04/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

use serde::{Deserialize, Serialize};
use std::path::PathBuf;

pub type BreezrResult<T> = anyhow::Result<T>;

#[derive(Debug, Serialize, Deserialize)]
pub struct ApiResponse<T> {
    pub success: bool,
    pub message: Option<String>,
    pub data: Option<T>,
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
pub enum JunkType {
    Cache,
    Logs,
    AppData,
    Trash,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct JunkItem {
    pub path: PathBuf,
    pub size: u64,
    pub kind: JunkType,
}
