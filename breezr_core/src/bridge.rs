//
//  breezr
//  bridge.rs
//
//  Created by Ngonidzashe Mangudya on 2025/04/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

use std::path::PathBuf;

use crate::cleanup::delete_items;
use crate::models::{ApiResponse, BreezrResult, JunkItem, JunkType};
use crate::scan::scan_directory;
use flutter_rust_bridge::frb;

fn wrap_api<T>(res: BreezrResult<T>) -> ApiResponse<T> {
    match res {
        Ok(data) => ApiResponse {
            success: true,
            message: None,
            data: Some(data),
        },
        Err(err) => ApiResponse {
            success: false,
            message: Some(err.to_string()),
            data: None,
        },
    }
}

#[frb]
pub fn scan_cache() -> ApiResponse<Vec<JunkItem>> {
    wrap_api(scan_directory("/Library/Caches", JunkType::Cache))
}

#[frb]
pub fn scan_logs() -> ApiResponse<Vec<JunkItem>> {
    wrap_api(scan_directory("/Library/Logs", JunkType::Logs))
}

#[frb]
pub fn scan_trash() -> ApiResponse<Vec<JunkItem>> {
    // macOS user trash lives at  ~/ .Trash
    let trash_path = get_user_home_directory().join(".Trash");

    wrap_api(scan_directory(
        trash_path.to_string_lossy().as_ref(),
        JunkType::Trash,
    ))
}

#[frb]
pub fn clean_items(items: Vec<JunkItem>) -> ApiResponse<u64> {
    wrap_api(delete_items(&items))
}

/// Return the current user’s home directory.
///
/// * macOS/Linux:  reads `$HOME`
///
/// Falls back to the root of the drive (`/`) if none is set.
pub fn get_user_home_directory() -> PathBuf {
    match std::env::var_os("HOME") {
        Some(path) => PathBuf::from(path),
        None => PathBuf::from("/"),
    }
}
