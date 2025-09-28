module TD.Data.CanSendGiftResult
  (CanSendGiftResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Describes whether a gift can be sent now by the current user
data CanSendGiftResult
  = CanSendGiftResultOk -- ^ The gift can be sent now by the current user
  | CanSendGiftResultFail -- ^ The gift can't be sent now by the current user
    { reason :: Maybe FormattedText.FormattedText -- ^ Reason to be shown to the user
    }
  deriving (Eq, Show)

instance I.ShortShow CanSendGiftResult where
  shortShow CanSendGiftResultOk
      = "CanSendGiftResultOk"
  shortShow CanSendGiftResultFail
    { reason = reason_
    }
      = "CanSendGiftResultFail"
        ++ I.cc
        [ "reason" `I.p` reason_
        ]

instance AT.FromJSON CanSendGiftResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "canSendGiftResultOk"   -> pure CanSendGiftResultOk
      "canSendGiftResultFail" -> parseCanSendGiftResultFail v
      _                       -> mempty
    
    where
      parseCanSendGiftResultFail :: A.Value -> AT.Parser CanSendGiftResult
      parseCanSendGiftResultFail = A.withObject "CanSendGiftResultFail" $ \o -> do
        reason_ <- o A..:?  "reason"
        pure $ CanSendGiftResultFail
          { reason = reason_
          }
  parseJSON _ = mempty

