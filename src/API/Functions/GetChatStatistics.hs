-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatStatistics = 
 GetChatStatistics { is_dark :: Bool, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatStatistics where
 toJSON (GetChatStatistics { is_dark = is_dark, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatStatistics", "is_dark" A..= is_dark, "chat_id" A..= chat_id ]
-- getChatStatistics GetChatStatistics  { is_dark :: Bool, chat_id :: Int } 



instance T.FromJSON GetChatStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatStatistics" -> parseGetChatStatistics v
  where
   parseGetChatStatistics :: A.Value -> T.Parser GetChatStatistics
   parseGetChatStatistics = A.withObject "GetChatStatistics" $ \o -> do
    is_dark <- o A..: "is_dark"
    chat_id <- o A..: "chat_id"
    return $ GetChatStatistics { is_dark = is_dark, chat_id = chat_id }