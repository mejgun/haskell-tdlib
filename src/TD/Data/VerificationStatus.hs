module TD.Data.VerificationStatus
  (VerificationStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data VerificationStatus
  = VerificationStatus -- ^ Contains information about verification status of a chat or a user
    { is_verified                           :: Maybe Bool -- ^ True, if the chat or the user is verified by Telegram
    , is_scam                               :: Maybe Bool -- ^ True, if the chat or the user is marked as scam by Telegram
    , is_fake                               :: Maybe Bool -- ^ True, if the chat or the user is marked as fake by Telegram
    , bot_verification_icon_custom_emoji_id :: Maybe Int  -- ^ Identifier of the custom emoji to be shown as verification sign provided by a bot for the user; 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow VerificationStatus where
  shortShow VerificationStatus
    { is_verified                           = is_verified_
    , is_scam                               = is_scam_
    , is_fake                               = is_fake_
    , bot_verification_icon_custom_emoji_id = bot_verification_icon_custom_emoji_id_
    }
      = "VerificationStatus"
        ++ I.cc
        [ "is_verified"                           `I.p` is_verified_
        , "is_scam"                               `I.p` is_scam_
        , "is_fake"                               `I.p` is_fake_
        , "bot_verification_icon_custom_emoji_id" `I.p` bot_verification_icon_custom_emoji_id_
        ]

instance AT.FromJSON VerificationStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "verificationStatus" -> parseVerificationStatus v
      _                    -> mempty
    
    where
      parseVerificationStatus :: A.Value -> AT.Parser VerificationStatus
      parseVerificationStatus = A.withObject "VerificationStatus" $ \o -> do
        is_verified_                           <- o A..:?                       "is_verified"
        is_scam_                               <- o A..:?                       "is_scam"
        is_fake_                               <- o A..:?                       "is_fake"
        bot_verification_icon_custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "bot_verification_icon_custom_emoji_id"
        pure $ VerificationStatus
          { is_verified                           = is_verified_
          , is_scam                               = is_scam_
          , is_fake                               = is_fake_
          , bot_verification_icon_custom_emoji_id = bot_verification_icon_custom_emoji_id_
          }
  parseJSON _ = mempty

