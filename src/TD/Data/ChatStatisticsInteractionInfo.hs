module TD.Data.ChatStatisticsInteractionInfo
  (ChatStatisticsInteractionInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatStatisticsObjectType as ChatStatisticsObjectType

data ChatStatisticsInteractionInfo
  = ChatStatisticsInteractionInfo -- ^ Contains statistics about interactions with a message sent in the chat or a story sent by the chat
    { object_type    :: Maybe ChatStatisticsObjectType.ChatStatisticsObjectType -- ^ Type of the object
    , view_count     :: Maybe Int                                               -- ^ Number of times the object was viewed
    , forward_count  :: Maybe Int                                               -- ^ Number of times the object was forwarded
    , reaction_count :: Maybe Int                                               -- ^ Number of times reactions were added to the object
    }
  deriving (Eq, Show)

instance I.ShortShow ChatStatisticsInteractionInfo where
  shortShow ChatStatisticsInteractionInfo
    { object_type    = object_type_
    , view_count     = view_count_
    , forward_count  = forward_count_
    , reaction_count = reaction_count_
    }
      = "ChatStatisticsInteractionInfo"
        ++ I.cc
        [ "object_type"    `I.p` object_type_
        , "view_count"     `I.p` view_count_
        , "forward_count"  `I.p` forward_count_
        , "reaction_count" `I.p` reaction_count_
        ]

instance AT.FromJSON ChatStatisticsInteractionInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatStatisticsInteractionInfo" -> parseChatStatisticsInteractionInfo v
      _                               -> mempty
    
    where
      parseChatStatisticsInteractionInfo :: A.Value -> AT.Parser ChatStatisticsInteractionInfo
      parseChatStatisticsInteractionInfo = A.withObject "ChatStatisticsInteractionInfo" $ \o -> do
        object_type_    <- o A..:?  "object_type"
        view_count_     <- o A..:?  "view_count"
        forward_count_  <- o A..:?  "forward_count"
        reaction_count_ <- o A..:?  "reaction_count"
        pure $ ChatStatisticsInteractionInfo
          { object_type    = object_type_
          , view_count     = view_count_
          , forward_count  = forward_count_
          , reaction_count = reaction_count_
          }
  parseJSON _ = mempty

