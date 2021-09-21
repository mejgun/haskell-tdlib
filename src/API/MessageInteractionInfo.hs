-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageInteractionInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageReplyInfo as MessageReplyInfo

-- |
-- 
-- Contains information about interactions with a message
-- 
-- __view_count__ Number of times the message was viewed
-- 
-- __forward_count__ Number of times the message was forwarded
-- 
-- __reply_info__ Contains information about direct or indirect replies to the message; may be null. Currently, available only in channels with a discussion supergroup and discussion supergroups for messages, which are not replies itself
data MessageInteractionInfo = 

 MessageInteractionInfo { reply_info :: Maybe MessageReplyInfo.MessageReplyInfo, forward_count :: Maybe Int, view_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON MessageInteractionInfo where
 toJSON (MessageInteractionInfo { reply_info = reply_info, forward_count = forward_count, view_count = view_count }) =
  A.object [ "@type" A..= T.String "messageInteractionInfo", "reply_info" A..= reply_info, "forward_count" A..= forward_count, "view_count" A..= view_count ]

instance T.FromJSON MessageInteractionInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageInteractionInfo" -> parseMessageInteractionInfo v
   _ -> mempty
  where
   parseMessageInteractionInfo :: A.Value -> T.Parser MessageInteractionInfo
   parseMessageInteractionInfo = A.withObject "MessageInteractionInfo" $ \o -> do
    reply_info <- o A..:? "reply_info"
    forward_count <- mconcat [ o A..:? "forward_count", readMaybe <$> (o A..: "forward_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    view_count <- mconcat [ o A..:? "view_count", readMaybe <$> (o A..: "view_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageInteractionInfo { reply_info = reply_info, forward_count = forward_count, view_count = view_count }