module TD.Data.TopChatCategory
  ( TopChatCategory(..) 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data TopChatCategory -- ^ Represents the categories of chats for which a list of frequently used chats can be retrieved
  = TopChatCategoryUsers -- ^ A category containing frequently used private chats with non-bot users
  | TopChatCategoryBots -- ^ A category containing frequently used private chats with bot users
  | TopChatCategoryGroups -- ^ A category containing frequently used basic groups and supergroups
  | TopChatCategoryChannels -- ^ A category containing frequently used channels
  | TopChatCategoryInlineBots -- ^ A category containing frequently used chats with inline bots sorted by their usage in inline mode
  | TopChatCategoryCalls -- ^ A category containing frequently used chats used for calls
  | TopChatCategoryForwardChats -- ^ A category containing frequently used chats used to forward messages
  deriving (Eq)

instance Show TopChatCategory where
  show TopChatCategoryUsers
      = "TopChatCategoryUsers"
  show TopChatCategoryBots
      = "TopChatCategoryBots"
  show TopChatCategoryGroups
      = "TopChatCategoryGroups"
  show TopChatCategoryChannels
      = "TopChatCategoryChannels"
  show TopChatCategoryInlineBots
      = "TopChatCategoryInlineBots"
  show TopChatCategoryCalls
      = "TopChatCategoryCalls"
  show TopChatCategoryForwardChats
      = "TopChatCategoryForwardChats"

instance AT.FromJSON TopChatCategory where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "topChatCategoryUsers"        -> pure TopChatCategoryUsers
      "topChatCategoryBots"         -> pure TopChatCategoryBots
      "topChatCategoryGroups"       -> pure TopChatCategoryGroups
      "topChatCategoryChannels"     -> pure TopChatCategoryChannels
      "topChatCategoryInlineBots"   -> pure TopChatCategoryInlineBots
      "topChatCategoryCalls"        -> pure TopChatCategoryCalls
      "topChatCategoryForwardChats" -> pure TopChatCategoryForwardChats
      _                             -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON TopChatCategory where
  toJSON TopChatCategoryUsers
      = A.object
        [ "@type" A..= AT.String "topChatCategoryUsers"
        ]
  toJSON TopChatCategoryBots
      = A.object
        [ "@type" A..= AT.String "topChatCategoryBots"
        ]
  toJSON TopChatCategoryGroups
      = A.object
        [ "@type" A..= AT.String "topChatCategoryGroups"
        ]
  toJSON TopChatCategoryChannels
      = A.object
        [ "@type" A..= AT.String "topChatCategoryChannels"
        ]
  toJSON TopChatCategoryInlineBots
      = A.object
        [ "@type" A..= AT.String "topChatCategoryInlineBots"
        ]
  toJSON TopChatCategoryCalls
      = A.object
        [ "@type" A..= AT.String "topChatCategoryCalls"
        ]
  toJSON TopChatCategoryForwardChats
      = A.object
        [ "@type" A..= AT.String "topChatCategoryForwardChats"
        ]

