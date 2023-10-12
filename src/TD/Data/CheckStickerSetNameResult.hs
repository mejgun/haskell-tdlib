module TD.Data.CheckStickerSetNameResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data CheckStickerSetNameResult -- ^ Represents result of checking whether a name can be used for a new sticker set
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
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "checkStickerSetNameResultOk"           -> pure CheckStickerSetNameResultOk
      "checkStickerSetNameResultNameInvalid"  -> pure CheckStickerSetNameResultNameInvalid
      "checkStickerSetNameResultNameOccupied" -> pure CheckStickerSetNameResultNameOccupied
      _                                       -> mempty
    

instance AT.ToJSON CheckStickerSetNameResult where
  toJSON CheckStickerSetNameResultOk
      = A.object
        [ "@type" A..= AT.String "checkStickerSetNameResultOk"
        ]
  toJSON CheckStickerSetNameResultNameInvalid
      = A.object
        [ "@type" A..= AT.String "checkStickerSetNameResultNameInvalid"
        ]
  toJSON CheckStickerSetNameResultNameOccupied
      = A.object
        [ "@type" A..= AT.String "checkStickerSetNameResultNameOccupied"
        ]
