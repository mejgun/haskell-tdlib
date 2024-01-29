module TD.Data.FoundSavedMessagesTopic
  (FoundSavedMessagesTopic(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SavedMessagesTopic as SavedMessagesTopic
import qualified TD.Data.Message as Message

data FoundSavedMessagesTopic
  = FoundSavedMessagesTopic -- ^ Contains information about a found Saved Messages topic
    { topic        :: Maybe SavedMessagesTopic.SavedMessagesTopic -- ^ The topic
    , last_message :: Maybe Message.Message                       -- ^ Last message in the topic; may be null if none or unknown
    }
  deriving (Eq, Show)

instance I.ShortShow FoundSavedMessagesTopic where
  shortShow FoundSavedMessagesTopic
    { topic        = topic_
    , last_message = last_message_
    }
      = "FoundSavedMessagesTopic"
        ++ I.cc
        [ "topic"        `I.p` topic_
        , "last_message" `I.p` last_message_
        ]

instance AT.FromJSON FoundSavedMessagesTopic where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundSavedMessagesTopic" -> parseFoundSavedMessagesTopic v
      _                         -> mempty
    
    where
      parseFoundSavedMessagesTopic :: A.Value -> AT.Parser FoundSavedMessagesTopic
      parseFoundSavedMessagesTopic = A.withObject "FoundSavedMessagesTopic" $ \o -> do
        topic_        <- o A..:?  "topic"
        last_message_ <- o A..:?  "last_message"
        pure $ FoundSavedMessagesTopic
          { topic        = topic_
          , last_message = last_message_
          }
  parseJSON _ = mempty

