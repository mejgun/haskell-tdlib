-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatHasProtectedContent where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Changes the ability of users to save, forward, or copy chat content. Supported only for basic groups, supergroups and channels. Requires owner privileges
-- 
-- __chat_id__ Chat identifier
-- 
-- __has_protected_content__ New value of has_protected_content
data ToggleChatHasProtectedContent = 

 ToggleChatHasProtectedContent { has_protected_content :: Maybe Bool, chat_id :: Maybe Int }  deriving (Eq)

instance Show ToggleChatHasProtectedContent where
 show ToggleChatHasProtectedContent { has_protected_content=has_protected_content, chat_id=chat_id } =
  "ToggleChatHasProtectedContent" ++ U.cc [U.p "has_protected_content" has_protected_content, U.p "chat_id" chat_id ]

instance T.ToJSON ToggleChatHasProtectedContent where
 toJSON ToggleChatHasProtectedContent { has_protected_content = has_protected_content, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "toggleChatHasProtectedContent", "has_protected_content" A..= has_protected_content, "chat_id" A..= chat_id ]

instance T.FromJSON ToggleChatHasProtectedContent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleChatHasProtectedContent" -> parseToggleChatHasProtectedContent v
   _ -> mempty
  where
   parseToggleChatHasProtectedContent :: A.Value -> T.Parser ToggleChatHasProtectedContent
   parseToggleChatHasProtectedContent = A.withObject "ToggleChatHasProtectedContent" $ \o -> do
    has_protected_content <- o A..:? "has_protected_content"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleChatHasProtectedContent { has_protected_content = has_protected_content, chat_id = chat_id }
 parseJSON _ = mempty
