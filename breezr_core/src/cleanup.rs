//
//  breezr
//  cleanup.rs
//
//  Created by Ngonidzashe Mangudya on 2025/04/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

use std::fs;

use crate::models::{BreezrResult, JunkItem};

pub fn delete_items(items: &[JunkItem]) -> BreezrResult<u64> {
    let mut total_freed = 0;

    for item in items {
        if fs::remove_file(&item.path).is_ok() {
            total_freed += item.size;
        }
    }

    Ok(total_freed)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::models::{JunkItem, JunkType};
    use tempfile::tempdir;

    #[test]
    fn deletes_files_and_reports_bytes_freed() {
        let dir = tempdir().unwrap();
        let file_path = dir.path().join("temp.log");
        std::fs::write(&file_path, b"hello").unwrap(); // 5 bytes

        let items = vec![JunkItem {
            path: file_path.clone(),
            size: 5,
            kind: JunkType::Logs,
        }];

        let freed = delete_items(&items).unwrap();
        assert_eq!(freed, 5);
        assert!(!file_path.exists()); // file should be gone
    }
}
