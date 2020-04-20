-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatStatisticsGraph where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatStatisticsGraph = 
 GetChatStatisticsGraph { x :: Int, token :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatStatisticsGraph where
 toJSON (GetChatStatisticsGraph { x = x, token = token, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatStatisticsGraph", "x" A..= x, "token" A..= token, "chat_id" A..= chat_id ]
-- getChatStatisticsGraph GetChatStatisticsGraph  { x :: Int, token :: String, chat_id :: Int } 



instance T.FromJSON GetChatStatisticsGraph where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatStatisticsGraph" -> parseGetChatStatisticsGraph v
  where
   parseGetChatStatisticsGraph :: A.Value -> T.Parser GetChatStatisticsGraph
   parseGetChatStatisticsGraph = A.withObject "GetChatStatisticsGraph" $ \o -> do
    x <- o A..: "x"
    token <- o A..: "token"
    chat_id <- o A..: "chat_id"
    return $ GetChatStatisticsGraph { x = x, token = token, chat_id = chat_id }