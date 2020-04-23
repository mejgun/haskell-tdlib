-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatisticsMessageInteractionCounters where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChatStatisticsMessageInteractionCounters = 
 ChatStatisticsMessageInteractionCounters { forward_count :: Maybe Int, view_count :: Maybe Int, message_id :: Maybe Int }  deriving (Show)

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
    forward_count <- optional $ o A..: "forward_count"
    view_count <- optional $ o A..: "view_count"
    message_id <- optional $ o A..: "message_id"
    return $ ChatStatisticsMessageInteractionCounters { forward_count = forward_count, view_count = view_count, message_id = message_id }