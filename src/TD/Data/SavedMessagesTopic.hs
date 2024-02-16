module TD.Data.SavedMessagesTopic
  (SavedMessagesTopic(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SavedMessagesTopicType as SavedMessagesTopicType
import qualified TD.Data.Message as Message
import qualified TD.Data.DraftMessage as DraftMessage

data SavedMessagesTopic
  = SavedMessagesTopic -- ^ Contains information about a Saved Messages topic
    { _id           :: Maybe Int                                           -- ^ Unique topic identifier
    , _type         :: Maybe SavedMessagesTopicType.SavedMessagesTopicType -- ^ Type of the topic
    , is_pinned     :: Maybe Bool                                          -- ^ True, if the topic is pinned
    , order         :: Maybe Int                                           -- ^ A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order
    , last_message  :: Maybe Message.Message                               -- ^ Last message in the topic; may be null if none or unknown
    , draft_message :: Maybe DraftMessage.DraftMessage                     -- ^ A draft of a message in the topic; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow SavedMessagesTopic where
  shortShow SavedMessagesTopic
    { _id           = _id_
    , _type         = _type_
    , is_pinned     = is_pinned_
    , order         = order_
    , last_message  = last_message_
    , draft_message = draft_message_
    }
      = "SavedMessagesTopic"
        ++ I.cc
        [ "_id"           `I.p` _id_
        , "_type"         `I.p` _type_
        , "is_pinned"     `I.p` is_pinned_
        , "order"         `I.p` order_
        , "last_message"  `I.p` last_message_
        , "draft_message" `I.p` draft_message_
        ]

instance AT.FromJSON SavedMessagesTopic where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "savedMessagesTopic" -> parseSavedMessagesTopic v
      _                    -> mempty
    
    where
      parseSavedMessagesTopic :: A.Value -> AT.Parser SavedMessagesTopic
      parseSavedMessagesTopic = A.withObject "SavedMessagesTopic" $ \o -> do
        _id_           <- o A..:?                       "id"
        _type_         <- o A..:?                       "type"
        is_pinned_     <- o A..:?                       "is_pinned"
        order_         <- fmap I.readInt64 <$> o A..:?  "order"
        last_message_  <- o A..:?                       "last_message"
        draft_message_ <- o A..:?                       "draft_message"
        pure $ SavedMessagesTopic
          { _id           = _id_
          , _type         = _type_
          , is_pinned     = is_pinned_
          , order         = order_
          , last_message  = last_message_
          , draft_message = draft_message_
          }
  parseJSON _ = mempty

