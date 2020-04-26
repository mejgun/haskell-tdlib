-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatisticsMessageInteractionCounters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains statistics about interactions with a message
-- 
-- __message_id__ Message identifier
-- 
-- __view_count__ Number of times the message was viewed
-- 
-- __forward_count__ Number of times the message was forwarded
data ChatStatisticsMessageInteractionCounters = 
 ChatStatisticsMessageInteractionCounters { forward_count :: Maybe Int, view_count :: Maybe Int, message_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatStatisticsMessageInteractionCounters where
 toJSON (ChatStatisticsMessageInteractionCounters { forward_count = forward_count, view_count = view_count, message_id = message_id }) =
  A.object [ "@type" A..= T.String "chatStatisticsMessageInteractionCounters", "forward_count" A..= forward_count, "view_count" A..= view_count, "message_id" A..= message_id ]

instance T.FromJSON ChatStatisticsMessageInteractionCounters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatStatisticsMessageInteractionCounters" -> parseChatStatisticsMessageInteractionCounters v
   _ -> mempty
  where
   parseChatStatisticsMessageInteractionCounters :: A.Value -> T.Parser ChatStatisticsMessageInteractionCounters
   parseChatStatisticsMessageInteractionCounters = A.withObject "ChatStatisticsMessageInteractionCounters" $ \o -> do
    forward_count <- mconcat [ o A..:? "forward_count", readMaybe <$> (o A..: "forward_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    view_count <- mconcat [ o A..:? "view_count", readMaybe <$> (o A..: "view_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatStatisticsMessageInteractionCounters { forward_count = forward_count, view_count = view_count, message_id = message_id }