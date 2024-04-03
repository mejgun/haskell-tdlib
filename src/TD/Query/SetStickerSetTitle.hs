module TD.Query.SetStickerSetTitle
  (SetStickerSetTitle(..)
  , defaultSetStickerSetTitle
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sets a sticker set title. Returns 'TD.Data.Ok.Ok'
data SetStickerSetTitle
  = SetStickerSetTitle
    { name  :: Maybe T.Text -- ^ Sticker set name. The sticker set must be owned by the current user
    , title :: Maybe T.Text -- ^ New sticker set title
    }
  deriving (Eq, Show)

instance I.ShortShow SetStickerSetTitle where
  shortShow
    SetStickerSetTitle
      { name  = name_
      , title = title_
      }
        = "SetStickerSetTitle"
          ++ I.cc
          [ "name"  `I.p` name_
          , "title" `I.p` title_
          ]

instance AT.ToJSON SetStickerSetTitle where
  toJSON
    SetStickerSetTitle
      { name  = name_
      , title = title_
      }
        = A.object
          [ "@type" A..= AT.String "setStickerSetTitle"
          , "name"  A..= name_
          , "title" A..= title_
          ]

defaultSetStickerSetTitle :: SetStickerSetTitle
defaultSetStickerSetTitle =
  SetStickerSetTitle
    { name  = Nothing
    , title = Nothing
    }

