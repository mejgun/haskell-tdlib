-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatStatisticsGraph where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetChatStatisticsGraph = 
 GetChatStatisticsGraph { x :: Maybe Int, token :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatStatisticsGraph where
 toJSON (GetChatStatisticsGraph { x = x, token = token, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatStatisticsGraph", "x" A..= x, "token" A..= token, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatStatisticsGraph where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatStatisticsGraph" -> parseGetChatStatisticsGraph v
   _ -> mempty
  where
   parseGetChatStatisticsGraph :: A.Value -> T.Parser GetChatStatisticsGraph
   parseGetChatStatisticsGraph = A.withObject "GetChatStatisticsGraph" $ \o -> do
    x <- optional $ o A..: "x"
    token <- optional $ o A..: "token"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetChatStatisticsGraph { x = x, token = token, chat_id = chat_id }