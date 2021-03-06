-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TopChatCategory where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents the categories of chats for which a list of frequently used chats can be retrieved
data TopChatCategory = 
 -- |
 -- 
 -- A category containing frequently used private chats with non-bot users
 TopChatCategoryUsers |
 -- |
 -- 
 -- A category containing frequently used private chats with bot users
 TopChatCategoryBots |
 -- |
 -- 
 -- A category containing frequently used basic groups and supergroups
 TopChatCategoryGroups |
 -- |
 -- 
 -- A category containing frequently used channels
 TopChatCategoryChannels |
 -- |
 -- 
 -- A category containing frequently used chats with inline bots sorted by their usage in inline mode
 TopChatCategoryInlineBots |
 -- |
 -- 
 -- A category containing frequently used chats used for calls
 TopChatCategoryCalls |
 -- |
 -- 
 -- A category containing frequently used chats used to forward messages
 TopChatCategoryForwardChats deriving (Show, Eq)

instance T.ToJSON TopChatCategory where
 toJSON (TopChatCategoryUsers {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryUsers" ]

 toJSON (TopChatCategoryBots {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryBots" ]

 toJSON (TopChatCategoryGroups {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryGroups" ]

 toJSON (TopChatCategoryChannels {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryChannels" ]

 toJSON (TopChatCategoryInlineBots {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryInlineBots" ]

 toJSON (TopChatCategoryCalls {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryCalls" ]

 toJSON (TopChatCategoryForwardChats {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryForwardChats" ]

instance T.FromJSON TopChatCategory where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "topChatCategoryUsers" -> parseTopChatCategoryUsers v
   "topChatCategoryBots" -> parseTopChatCategoryBots v
   "topChatCategoryGroups" -> parseTopChatCategoryGroups v
   "topChatCategoryChannels" -> parseTopChatCategoryChannels v
   "topChatCategoryInlineBots" -> parseTopChatCategoryInlineBots v
   "topChatCategoryCalls" -> parseTopChatCategoryCalls v
   "topChatCategoryForwardChats" -> parseTopChatCategoryForwardChats v
   _ -> mempty
  where
   parseTopChatCategoryUsers :: A.Value -> T.Parser TopChatCategory
   parseTopChatCategoryUsers = A.withObject "TopChatCategoryUsers" $ \o -> do
    return $ TopChatCategoryUsers {  }

   parseTopChatCategoryBots :: A.Value -> T.Parser TopChatCategory
   parseTopChatCategoryBots = A.withObject "TopChatCategoryBots" $ \o -> do
    return $ TopChatCategoryBots {  }

   parseTopChatCategoryGroups :: A.Value -> T.Parser TopChatCategory
   parseTopChatCategoryGroups = A.withObject "TopChatCategoryGroups" $ \o -> do
    return $ TopChatCategoryGroups {  }

   parseTopChatCategoryChannels :: A.Value -> T.Parser TopChatCategory
   parseTopChatCategoryChannels = A.withObject "TopChatCategoryChannels" $ \o -> do
    return $ TopChatCategoryChannels {  }

   parseTopChatCategoryInlineBots :: A.Value -> T.Parser TopChatCategory
   parseTopChatCategoryInlineBots = A.withObject "TopChatCategoryInlineBots" $ \o -> do
    return $ TopChatCategoryInlineBots {  }

   parseTopChatCategoryCalls :: A.Value -> T.Parser TopChatCategory
   parseTopChatCategoryCalls = A.withObject "TopChatCategoryCalls" $ \o -> do
    return $ TopChatCategoryCalls {  }

   parseTopChatCategoryForwardChats :: A.Value -> T.Parser TopChatCategory
   parseTopChatCategoryForwardChats = A.withObject "TopChatCategoryForwardChats" $ \o -> do
    return $ TopChatCategoryForwardChats {  }