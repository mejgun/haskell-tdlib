module TD.Data.CheckStickerSetNameResult
  (CheckStickerSetNameResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Represents result of checking whether a name can be used for a new sticker set
data CheckStickerSetNameResult
  = CheckStickerSetNameResultOk -- ^ The name can be set
  | CheckStickerSetNameResultNameInvalid -- ^ The name is invalid
  | CheckStickerSetNameResultNameOccupied -- ^ The name is occupied
  deriving (Eq)

instance Show CheckStickerSetNameResult where
  show CheckStickerSetNameResultOk
      = "CheckStickerSetNameResultOk"
  show CheckStickerSetNameResultNameInvalid
      = "CheckStickerSetNameResultNameInvalid"
  show CheckStickerSetNameResultNameOccupied
      = "CheckStickerSetNameResultNameOccupied"

instance AT.FromJSON CheckStickerSetNameResult where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "checkStickerSetNameResultOk"           -> pure CheckStickerSetNameResultOk
      "checkStickerSetNameResultNameInvalid"  -> pure CheckStickerSetNameResultNameInvalid
      "checkStickerSetNameResultNameOccupied" -> pure CheckStickerSetNameResultNameOccupied
      _                                       -> mempty
    
  parseJSON _ = mempty

