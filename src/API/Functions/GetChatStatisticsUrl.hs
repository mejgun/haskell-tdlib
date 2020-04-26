-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatStatisticsUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns an HTTP URL with the chat statistics. Currently this method of getting the statistics is disabled and can be deleted in the future 
-- 
-- __chat_id__ Chat identifier
-- 
-- __parameters__ Parameters from "tg://statsrefresh?params=******" link
-- 
-- __is_dark__ Pass true if a URL with the dark theme must be returned
data GetChatStatisticsUrl = 
 GetChatStatisticsUrl { is_dark :: Maybe Bool, parameters :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatStatisticsUrl where
 toJSON (GetChatStatisticsUrl { is_dark = is_dark, parameters = parameters, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatStatisticsUrl", "is_dark" A..= is_dark, "parameters" A..= parameters, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatStatisticsUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatStatisticsUrl" -> parseGetChatStatisticsUrl v
   _ -> mempty
  where
   parseGetChatStatisticsUrl :: A.Value -> T.Parser GetChatStatisticsUrl
   parseGetChatStatisticsUrl = A.withObject "GetChatStatisticsUrl" $ \o -> do
    is_dark <- o A..:? "is_dark"
    parameters <- o A..:? "parameters"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatStatisticsUrl { is_dark = is_dark, parameters = parameters, chat_id = chat_id }