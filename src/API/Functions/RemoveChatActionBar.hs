-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveChatActionBar where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Removes a chat action bar without any other action 
-- 
-- __chat_id__ Chat identifier
data RemoveChatActionBar = 
 RemoveChatActionBar { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON RemoveChatActionBar where
 toJSON (RemoveChatActionBar { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "removeChatActionBar", "chat_id" A..= chat_id ]

instance T.FromJSON RemoveChatActionBar where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeChatActionBar" -> parseRemoveChatActionBar v
   _ -> mempty
  where
   parseRemoveChatActionBar :: A.Value -> T.Parser RemoveChatActionBar
   parseRemoveChatActionBar = A.withObject "RemoveChatActionBar" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RemoveChatActionBar { chat_id = chat_id }