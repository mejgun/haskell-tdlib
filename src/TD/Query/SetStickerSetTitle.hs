module TD.Query.SetStickerSetTitle
  (SetStickerSetTitle(..)
  , defaultSetStickerSetTitle
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SetStickerSetTitle -- ^ Sets a sticker set title; for bots only
  = SetStickerSetTitle
    { name  :: Maybe T.Text -- ^ Sticker set name
    , title :: Maybe T.Text -- ^ New sticker set title
    }
  deriving (Eq)

instance Show SetStickerSetTitle where
  show
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

