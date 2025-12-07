// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Diary
 * @dev A decentralized diary application for immutable journal entries on the Celo blockchain
 * @notice This contract allows users to create permanent, timestamped diary entries
 */
contract Diary {
    
    /// @dev Structure to represent a single diary entry
    struct Entry {
        string content;      // The text content of the diary entry
        uint256 timestamp;   // Block timestamp when the entry was created
    }
    
    /// @dev Mapping from user address to their array of diary entries
    mapping(address => Entry[]) private userEntries;
    
    /// @dev Event emitted when a new entry is added
    event EntryAdded(
        address indexed user,
        uint256 indexed entryIndex,
        uint256 timestamp
    );
    
    /**
     * @dev Adds a new diary entry for the caller
     * @param _content The text content of the diary entry
     * @notice The entry is permanently stored with the current block timestamp
     * @notice Once added, entries cannot be modified or deleted (immutable)
     */
    function addEntry(string memory _content) public {
        require(bytes(_content).length > 0, "Entry content cannot be empty");
        require(bytes(_content).length <= 10000, "Entry content too long (max 10000 characters)");
        
        // Create new entry with current timestamp
        Entry memory newEntry = Entry({
            content: _content,
            timestamp: block.timestamp
        });
        
        // Add entry to user's array
        userEntries[msg.sender].push(newEntry);
        
        // Emit event for indexing and tracking
        emit EntryAdded(
            msg.sender,
            userEntries[msg.sender].length - 1,
            block.timestamp
        );
    }
    
    /**
     * @dev Retrieves all diary entries for a specific user
     * @param _user The address of the user whose entries to retrieve
     * @return An array of Entry structs containing all diary entries
     * @notice Returns entries in chronological order (oldest first)
     */
    function getEntries(address _user) public view returns (Entry[] memory) {
        return userEntries[_user];
    }
    
    /**
     * @dev Returns the total number of entries for a specific user
     * @param _user The address of the user
     * @return The count of diary entries
     */
    function getEntryCount(address _user) public view returns (uint256) {
        return userEntries[_user].length;
    }
    
    /**
     * @dev Retrieves a single entry by index for a specific user
     * @param _user The address of the user
     * @param _index The index of the entry to retrieve
     * @return content The text content of the entry
     * @return timestamp The timestamp when the entry was created
     */
    function getEntry(address _user, uint256 _index) 
        public 
        view 
        returns (string memory content, uint256 timestamp) 
    {
        require(_index < userEntries[_user].length, "Entry index out of bounds");
        
        Entry memory entry = userEntries[_user][_index];
        return (entry.content, entry.timestamp);
    }
}
