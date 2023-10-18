module TD.Query.CheckStickerSetName
  (CheckStickerSetName(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks whether a name can be used for a new sticker set. Returns 'TD.Data.CheckStickerSetNameResult.CheckStickerSetNameResult'
data CheckStickerSetName
  = CheckStickerSetName
    { name :: Maybe T.Text -- ^ Name to be checked
    }
  deriving (Eq, Show)

instance I.ShortShow CheckStickerSetName where
  shortShow
    CheckStickerSetName
      { name = name_
      }
        = "CheckStickerSetName"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON CheckStickerSetName where
  toJSON
    CheckStickerSetName
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "checkStickerSetName"
          , "name"  A..= name_
          ]

