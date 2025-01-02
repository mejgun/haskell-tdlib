module TD.Data.UpgradedGiftOriginalDetails
  (UpgradedGiftOriginalDetails(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data UpgradedGiftOriginalDetails
  = UpgradedGiftOriginalDetails -- ^ Describes the original details about the gift
    { sender_user_id   :: Maybe Int                         -- ^ Identifier of the user that sent the gift; 0 if the gift was private
    , receiver_user_id :: Maybe Int                         -- ^ Identifier of the user that received the gift
    , text             :: Maybe FormattedText.FormattedText -- ^ Message added to the gift
    , date             :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the gift was sent
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftOriginalDetails where
  shortShow UpgradedGiftOriginalDetails
    { sender_user_id   = sender_user_id_
    , receiver_user_id = receiver_user_id_
    , text             = text_
    , date             = date_
    }
      = "UpgradedGiftOriginalDetails"
        ++ I.cc
        [ "sender_user_id"   `I.p` sender_user_id_
        , "receiver_user_id" `I.p` receiver_user_id_
        , "text"             `I.p` text_
        , "date"             `I.p` date_
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
        sender_user_id_   <- o A..:?  "sender_user_id"
        receiver_user_id_ <- o A..:?  "receiver_user_id"
        text_             <- o A..:?  "text"
        date_             <- o A..:?  "date"
        pure $ UpgradedGiftOriginalDetails
          { sender_user_id   = sender_user_id_
          , receiver_user_id = receiver_user_id_
          , text             = text_
          , date             = date_
          }
  parseJSON _ = mempty

