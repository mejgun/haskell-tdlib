{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageInteractionInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageReaction as MessageReaction
import qualified TD.Data.MessageReplyInfo as MessageReplyInfo
import qualified Utils as U

-- |
data MessageInteractionInfo = -- | Contains information about interactions with a message
  MessageInteractionInfo
  { -- | The list of reactions added to the message
    reactions :: Maybe [MessageReaction.MessageReaction],
    -- | Information about direct or indirect replies to the message; may be null. Currently, available only in channels with a discussion supergroup and discussion supergroups for messages, which are not replies itself
    reply_info :: Maybe MessageReplyInfo.MessageReplyInfo,
    -- | Number of times the message was forwarded
    forward_count :: Maybe Int,
    -- | Number of times the message was viewed
    view_count :: Maybe Int
  }
  deriving (Eq)

instance Show MessageInteractionInfo where
  show
    MessageInteractionInfo
      { reactions = reactions_,
        reply_info = reply_info_,
        forward_count = forward_count_,
        view_count = view_count_
      } =
      "MessageInteractionInfo"
        ++ U.cc
          [ U.p "reactions" reactions_,
            U.p "reply_info" reply_info_,
            U.p "forward_count" forward_count_,
            U.p "view_count" view_count_
          ]

instance T.FromJSON MessageInteractionInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageInteractionInfo" -> parseMessageInteractionInfo v
      _ -> mempty
    where
      parseMessageInteractionInfo :: A.Value -> T.Parser MessageInteractionInfo
      parseMessageInteractionInfo = A.withObject "MessageInteractionInfo" $ \o -> do
        reactions_ <- o A..:? "reactions"
        reply_info_ <- o A..:? "reply_info"
        forward_count_ <- mconcat [o A..:? "forward_count", U.rm <$> (o A..: "forward_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        view_count_ <- mconcat [o A..:? "view_count", U.rm <$> (o A..: "view_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessageInteractionInfo {reactions = reactions_, reply_info = reply_info_, forward_count = forward_count_, view_count = view_count_}
  parseJSON _ = mempty

instance T.ToJSON MessageInteractionInfo where
  toJSON
    MessageInteractionInfo
      { reactions = reactions_,
        reply_info = reply_info_,
        forward_count = forward_count_,
        view_count = view_count_
      } =
      A.object
        [ "@type" A..= T.String "messageInteractionInfo",
          "reactions" A..= reactions_,
          "reply_info" A..= reply_info_,
          "forward_count" A..= forward_count_,
          "view_count" A..= view_count_
        ]
