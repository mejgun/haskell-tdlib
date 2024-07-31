module TD.Data.TopChatCategory
  (TopChatCategory(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents the categories of chats for which a list of frequently used chats can be retrieved
data TopChatCategory
  = TopChatCategoryUsers -- ^ A category containing frequently used private chats with non-bot users
  | TopChatCategoryBots -- ^ A category containing frequently used private chats with bot users
  | TopChatCategoryGroups -- ^ A category containing frequently used basic groups and supergroups
  | TopChatCategoryChannels -- ^ A category containing frequently used channels
  | TopChatCategoryInlineBots -- ^ A category containing frequently used chats with inline bots sorted by their usage in inline mode
  | TopChatCategoryWebAppBots -- ^ A category containing frequently used chats with bots, which Web Apps were opened
  | TopChatCategoryCalls -- ^ A category containing frequently used chats used for calls
  | TopChatCategoryForwardChats -- ^ A category containing frequently used chats used to forward messages
  deriving (Eq, Show)

instance I.ShortShow TopChatCategory where
  shortShow TopChatCategoryUsers
      = "TopChatCategoryUsers"
  shortShow TopChatCategoryBots
      = "TopChatCategoryBots"
  shortShow TopChatCategoryGroups
      = "TopChatCategoryGroups"
  shortShow TopChatCategoryChannels
      = "TopChatCategoryChannels"
  shortShow TopChatCategoryInlineBots
      = "TopChatCategoryInlineBots"
  shortShow TopChatCategoryWebAppBots
      = "TopChatCategoryWebAppBots"
  shortShow TopChatCategoryCalls
      = "TopChatCategoryCalls"
  shortShow TopChatCategoryForwardChats
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
      "topChatCategoryWebAppBots"   -> pure TopChatCategoryWebAppBots
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
  toJSON TopChatCategoryWebAppBots
      = A.object
        [ "@type" A..= AT.String "topChatCategoryWebAppBots"
        ]
  toJSON TopChatCategoryCalls
      = A.object
        [ "@type" A..= AT.String "topChatCategoryCalls"
        ]
  toJSON TopChatCategoryForwardChats
      = A.object
        [ "@type" A..= AT.String "topChatCategoryForwardChats"
        ]

