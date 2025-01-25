module TD.Data.UpgradedGiftOriginalDetails
  (UpgradedGiftOriginalDetails(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.FormattedText as FormattedText

data UpgradedGiftOriginalDetails
  = UpgradedGiftOriginalDetails -- ^ Describes the original details about the gift
    { sender_id   :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the chat that sent the gift; may be null if the gift was private
    , receiver_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the chat that received the gift
    , text        :: Maybe FormattedText.FormattedText -- ^ Message added to the gift
    , date        :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the gift was sent
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftOriginalDetails where
  shortShow UpgradedGiftOriginalDetails
    { sender_id   = sender_id_
    , receiver_id = receiver_id_
    , text        = text_
    , date        = date_
    }
      = "UpgradedGiftOriginalDetails"
        ++ I.cc
        [ "sender_id"   `I.p` sender_id_
        , "receiver_id" `I.p` receiver_id_
        , "text"        `I.p` text_
        , "date"        `I.p` date_
        ]

instance AT.FromJSON UpgradedGiftOriginalDetails where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftOriginalDetails" -> parseUpgradedGiftOriginalDetails v
      _                             -> mempty
    
    where
      parseUpgradedGiftOriginalDetails :: A.Value -> AT.Parser UpgradedGiftOriginalDetails
      parseUpgradedGiftOriginalDetails = A.withObject "UpgradedGiftOriginalDetails" $ \o -> do
        sender_id_   <- o A..:?  "sender_id"
        receiver_id_ <- o A..:?  "receiver_id"
        text_        <- o A..:?  "text"
        date_        <- o A..:?  "date"
        pure $ UpgradedGiftOriginalDetails
          { sender_id   = sender_id_
          , receiver_id = receiver_id_
          , text        = text_
          , date        = date_
          }
  parseJSON _ = mempty

