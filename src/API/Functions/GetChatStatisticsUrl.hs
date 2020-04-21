-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatStatisticsUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatStatisticsUrl = 
 GetChatStatisticsUrl { is_dark :: Bool, parameters :: String, chat_id :: Int }  deriving (Show)

instance T.ToJSON GetChatStatisticsUrl where
 toJSON (GetChatStatisticsUrl { is_dark = is_dark, parameters = parameters, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatStatisticsUrl", "is_dark" A..= is_dark, "parameters" A..= parameters, "chat_id" A..= chat_id ]



instance T.FromJSON GetChatStatisticsUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatStatisticsUrl" -> parseGetChatStatisticsUrl v

   _ -> mempty ""
  where
   parseGetChatStatisticsUrl :: A.Value -> T.Parser GetChatStatisticsUrl
   parseGetChatStatisticsUrl = A.withObject "GetChatStatisticsUrl" $ \o -> do
    is_dark <- o A..: "is_dark"
    parameters <- o A..: "parameters"
    chat_id <- o A..: "chat_id"
    return $ GetChatStatisticsUrl { is_dark = is_dark, parameters = parameters, chat_id = chat_id }