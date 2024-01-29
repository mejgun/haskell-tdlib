module TD.Data.MessageInteractionInfo
  (MessageInteractionInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageReplyInfo as MessageReplyInfo
import qualified TD.Data.MessageReactions as MessageReactions

data MessageInteractionInfo
  = MessageInteractionInfo -- ^ Contains information about interactions with a message
    { view_count    :: Maybe Int                               -- ^ Number of times the message was viewed
    , forward_count :: Maybe Int                               -- ^ Number of times the message was forwarded
    , reply_info    :: Maybe MessageReplyInfo.MessageReplyInfo -- ^ Information about direct or indirect replies to the message; may be null. Currently, available only in channels with a discussion supergroup and discussion supergroups for messages, which are not replies itself
    , reactions     :: Maybe MessageReactions.MessageReactions -- ^ The list of reactions or tags added to the message; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow MessageInteractionInfo where
  shortShow MessageInteractionInfo
    { view_count    = view_count_
    , forward_count = forward_count_
    , reply_info    = reply_info_
    , reactions     = reactions_
    }
      = "MessageInteractionInfo"
        ++ I.cc
        [ "view_count"    `I.p` view_count_
        , "forward_count" `I.p` forward_count_
        , "reply_info"    `I.p` reply_info_
        , "reactions"     `I.p` reactions_
        ]

instance AT.FromJSON MessageInteractionInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageInteractionInfo" -> parseMessageInteractionInfo v
      _                        -> mempty
    
    where
      parseMessageInteractionInfo :: A.Value -> AT.Parser MessageInteractionInfo
      parseMessageInteractionInfo = A.withObject "MessageInteractionInfo" $ \o -> do
        view_count_    <- o A..:?  "view_count"
        forward_count_ <- o A..:?  "forward_count"
        reply_info_    <- o A..:?  "reply_info"
        reactions_     <- o A..:?  "reactions"
        pure $ MessageInteractionInfo
          { view_count    = view_count_
          , forward_count = forward_count_
          , reply_info    = reply_info_
          , reactions     = reactions_
          }
  parseJSON _ = mempty

