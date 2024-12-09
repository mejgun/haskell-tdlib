module TD.Query.SearchStickers
  (SearchStickers(..)
  , defaultSearchStickers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType
import qualified Data.Text as T

-- | Searches for stickers from public sticker sets that correspond to any of the given emoji. Returns 'TD.Data.Stickers.Stickers'
data SearchStickers
  = SearchStickers
    { sticker_type         :: Maybe StickerType.StickerType -- ^ Type of the stickers to return
    , emojis               :: Maybe T.Text                  -- ^ Space-separated list of emojis to search for
    , query                :: Maybe T.Text                  -- ^ Query to search for; may be empty to search for emoji only
    , input_language_codes :: Maybe [T.Text]                -- ^ List of possible IETF language tags of the user's input language; may be empty if unknown
    , offset               :: Maybe Int                     -- ^ The offset from which to return the stickers; must be non-negative
    , limit                :: Maybe Int                     -- ^ The maximum number of stickers to be returned; 0-100
    }
  deriving (Eq, Show)

instance I.ShortShow SearchStickers where
  shortShow
    SearchStickers
      { sticker_type         = sticker_type_
      , emojis               = emojis_
      , query                = query_
      , input_language_codes = input_language_codes_
      , offset               = offset_
      , limit                = limit_
      }
        = "SearchStickers"
          ++ I.cc
          [ "sticker_type"         `I.p` sticker_type_
          , "emojis"               `I.p` emojis_
          , "query"                `I.p` query_
          , "input_language_codes" `I.p` input_language_codes_
          , "offset"               `I.p` offset_
          , "limit"                `I.p` limit_
          ]

instance AT.ToJSON SearchStickers where
  toJSON
    SearchStickers
      { sticker_type         = sticker_type_
      , emojis               = emojis_
      , query                = query_
      , input_language_codes = input_language_codes_
      , offset               = offset_
      , limit                = limit_
      }
        = A.object
          [ "@type"                A..= AT.String "searchStickers"
          , "sticker_type"         A..= sticker_type_
          , "emojis"               A..= emojis_
          , "query"                A..= query_
          , "input_language_codes" A..= input_language_codes_
          , "offset"               A..= offset_
          , "limit"                A..= limit_
          ]

defaultSearchStickers :: SearchStickers
defaultSearchStickers =
  SearchStickers
    { sticker_type         = Nothing
    , emojis               = Nothing
    , query                = Nothing
    , input_language_codes = Nothing
    , offset               = Nothing
    , limit                = Nothing
    }

