//
//  breezr
//  scan.rs
//
//  Created by Ngonidzashe Mangudya on 2025/04/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

use std::fs;

use crate::models::{BreezrResult, JunkItem, JunkType};

pub fn scan_directory(dir: &str, kind: JunkType) -> BreezrResult<Vec<JunkItem>> {
    let mut junk_items = vec![];

    if let Ok(entries) = fs::read_dir(dir) {
        for entry in entries.flatten() {
            let path = entry.path();
            if let Ok(metadata) = entry.metadata() {
                if metadata.is_file() {
                    junk_items.push(JunkItem {
                        path,
                        size: metadata.len(),
                        kind: kind.clone(),
                    });
                }
            }
        }
    }

    Ok(junk_items)
}

#[cfg(test)]
mod tests {
    use super::*;
    use tempfile::tempdir;

    #[test]
    fn scans_only_files_and_reports_size() {
        // Create a temp directory with two files and a sub-dir
        let dir = tempdir().unwrap();
        let file_a = dir.path().join("a.log");
        let file_b = dir.path().join("b.cache");
        let _subdir = std::fs::create_dir(dir.path().join("nested")).unwrap();

        std::fs::write(&file_a, b"12345").unwrap(); // 5 bytes
        std::fs::write(&file_b, b"12").unwrap(); // 2 bytes

        let items = scan_directory(dir.path().to_str().unwrap(), JunkType::Cache).unwrap(); // BreezrResult<Vec<JunkItem>>

        // We expect exactly the two files (size = 7 bytes total)
        assert_eq!(items.len(), 2);
        let total: u64 = items.iter().map(|i| i.size).sum();
        assert_eq!(total, 7);
        for item in items {
            assert!(item.kind == JunkType::Cache);
        }
    }
}
