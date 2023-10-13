module TD.Data.ChatStatisticsMessageInteractionInfo (ChatStatisticsMessageInteractionInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatStatisticsMessageInteractionInfo
  = ChatStatisticsMessageInteractionInfo -- ^ Contains statistics about interactions with a message
    { message_id    :: Maybe Int -- ^ Message identifier
    , view_count    :: Maybe Int -- ^ Number of times the message was viewed
    , forward_count :: Maybe Int -- ^ Number of times the message was forwarded
    }
  deriving (Eq)

instance Show ChatStatisticsMessageInteractionInfo where
  show ChatStatisticsMessageInteractionInfo
    { message_id    = message_id_
    , view_count    = view_count_
    , forward_count = forward_count_
    }
      = "ChatStatisticsMessageInteractionInfo"
        ++ I.cc
        [ "message_id"    `I.p` message_id_
        , "view_count"    `I.p` view_count_
        , "forward_count" `I.p` forward_count_
        ]

instance AT.FromJSON ChatStatisticsMessageInteractionInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatStatisticsMessageInteractionInfo" -> parseChatStatisticsMessageInteractionInfo v
      _                                      -> mempty
    
    where
      parseChatStatisticsMessageInteractionInfo :: A.Value -> AT.Parser ChatStatisticsMessageInteractionInfo
      parseChatStatisticsMessageInteractionInfo = A.withObject "ChatStatisticsMessageInteractionInfo" $ \o -> do
        message_id_    <- o A..:?  "message_id"
        view_count_    <- o A..:?  "view_count"
        forward_count_ <- o A..:?  "forward_count"
        pure $ ChatStatisticsMessageInteractionInfo
          { message_id    = message_id_
          , view_count    = view_count_
          , forward_count = forward_count_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatStatisticsMessageInteractionInfo where
  toJSON ChatStatisticsMessageInteractionInfo
    { message_id    = message_id_
    , view_count    = view_count_
    , forward_count = forward_count_
    }
      = A.object
        [ "@type"         A..= AT.String "chatStatisticsMessageInteractionInfo"
        , "message_id"    A..= message_id_
        , "view_count"    A..= view_count_
        , "forward_count" A..= forward_count_
        ]
