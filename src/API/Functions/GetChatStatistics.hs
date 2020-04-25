-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetChatStatistics = 
 GetChatStatistics { is_dark :: Maybe Bool, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatStatistics where
 toJSON (GetChatStatistics { is_dark = is_dark, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatStatistics", "is_dark" A..= is_dark, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatStatistics" -> parseGetChatStatistics v
   _ -> mempty
  where
   parseGetChatStatistics :: A.Value -> T.Parser GetChatStatistics
   parseGetChatStatistics = A.withObject "GetChatStatistics" $ \o -> do
    is_dark <- o A..:? "is_dark"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatStatistics { is_dark = is_dark, chat_id = chat_id }