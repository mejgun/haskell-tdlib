module TD.Query.SearchStickers
  (SearchStickers(..)
  , defaultSearchStickers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType
import qualified Data.Text as T

-- | Searches for stickers from public sticker sets that correspond to any of the given emoji
data SearchStickers
  = SearchStickers
    { sticker_type :: Maybe StickerType.StickerType -- ^ Type of the stickers to return
    , emojis       :: Maybe T.Text                  -- ^ Space-separated list of emoji to search for; must be non-empty
    , limit        :: Maybe Int                     -- ^ The maximum number of stickers to be returned; 0-100
    }
  deriving (Eq)

instance Show SearchStickers where
  show
    SearchStickers
      { sticker_type = sticker_type_
      , emojis       = emojis_
      , limit        = limit_
      }
        = "SearchStickers"
          ++ I.cc
          [ "sticker_type" `I.p` sticker_type_
          , "emojis"       `I.p` emojis_
          , "limit"        `I.p` limit_
          ]

instance AT.ToJSON SearchStickers where
  toJSON
    SearchStickers
      { sticker_type = sticker_type_
      , emojis       = emojis_
      , limit        = limit_
      }
        = A.object
          [ "@type"        A..= AT.String "searchStickers"
          , "sticker_type" A..= sticker_type_
          , "emojis"       A..= emojis_
          , "limit"        A..= limit_
          ]

defaultSearchStickers :: SearchStickers
defaultSearchStickers =
  SearchStickers
    { sticker_type = Nothing
    , emojis       = Nothing
    , limit        = Nothing
    }

