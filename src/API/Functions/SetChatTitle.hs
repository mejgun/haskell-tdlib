-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatTitle where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info rights. The title will not be changed until the request to the server has been completed
-- 
-- __chat_id__ Chat identifier
-- 
-- __title__ New title of the chat; 1-128 characters
data SetChatTitle = 

 SetChatTitle { title :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatTitle where
 toJSON (SetChatTitle { title = title, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatTitle", "title" A..= title, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatTitle where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatTitle" -> parseSetChatTitle v
   _ -> mempty
  where
   parseSetChatTitle :: A.Value -> T.Parser SetChatTitle
   parseSetChatTitle = A.withObject "SetChatTitle" $ \o -> do
    title <- o A..:? "title"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatTitle { title = title, chat_id = chat_id }