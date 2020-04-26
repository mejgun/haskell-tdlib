-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatStatisticsGraph where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Loads asynchronous or zoomed in chat statistics graph 
-- 
-- __chat_id__ Chat identifier
-- 
-- __token__ The token for graph loading
-- 
-- __x__ X-value for zoomed in graph or 0 otherwise
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
    x <- mconcat [ o A..:? "x", readMaybe <$> (o A..: "x" :: T.Parser String)] :: T.Parser (Maybe Int)
    token <- o A..:? "token"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatStatisticsGraph { x = x, token = token, chat_id = chat_id }