module TD.Data.SponsoredMessages
  (SponsoredMessages(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SponsoredMessage as SponsoredMessage

data SponsoredMessages
  = SponsoredMessages -- ^ Contains a list of sponsored messages
    { messages         :: Maybe [SponsoredMessage.SponsoredMessage] -- ^ List of sponsored messages
    , messages_between :: Maybe Int                                 -- ^ The minimum number of messages between shown sponsored messages, or 0 if only one sponsored message must be shown after all ordinary messages
    }
  deriving (Eq, Show)

instance I.ShortShow SponsoredMessages where
  shortShow SponsoredMessages
    { messages         = messages_
    , messages_between = messages_between_
    }
      = "SponsoredMessages"
        ++ I.cc
        [ "messages"         `I.p` messages_
        , "messages_between" `I.p` messages_between_
        ]

instance AT.FromJSON SponsoredMessages where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sponsoredMessages" -> parseSponsoredMessages v
      _                   -> mempty
    
    where
      parseSponsoredMessages :: A.Value -> AT.Parser SponsoredMessages
      parseSponsoredMessages = A.withObject "SponsoredMessages" $ \o -> do
        messages_         <- o A..:?  "messages"
        messages_between_ <- o A..:?  "messages_between"
        pure $ SponsoredMessages
          { messages         = messages_
          , messages_between = messages_between_
          }
  parseJSON _ = mempty

