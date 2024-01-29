module TD.Data.MessageReactions
  (MessageReactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageReaction as MessageReaction

data MessageReactions
  = MessageReactions -- ^ Contains a list of reactions added to a message
    { reactions :: Maybe [MessageReaction.MessageReaction] -- ^ List of added reactions
    , are_tags  :: Maybe Bool                              -- ^ True, if the reactions are tags and Telegram Premium users can filter messages by them; currently, always false
    }
  deriving (Eq, Show)

instance I.ShortShow MessageReactions where
  shortShow MessageReactions
    { reactions = reactions_
    , are_tags  = are_tags_
    }
      = "MessageReactions"
        ++ I.cc
        [ "reactions" `I.p` reactions_
        , "are_tags"  `I.p` are_tags_
        ]

instance AT.FromJSON MessageReactions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageReactions" -> parseMessageReactions v
      _                  -> mempty
    
    where
      parseMessageReactions :: A.Value -> AT.Parser MessageReactions
      parseMessageReactions = A.withObject "MessageReactions" $ \o -> do
        reactions_ <- o A..:?  "reactions"
        are_tags_  <- o A..:?  "are_tags"
        pure $ MessageReactions
          { reactions = reactions_
          , are_tags  = are_tags_
          }
  parseJSON _ = mempty

