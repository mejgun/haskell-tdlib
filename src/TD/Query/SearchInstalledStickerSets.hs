module TD.Query.SearchInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType

data SearchInstalledStickerSets -- ^ Searches for installed sticker sets by looking for specified query in their title and name
  = SearchInstalledStickerSets
    { sticker_type :: Maybe StickerType.StickerType -- ^ Type of the sticker sets to search for
    , query        :: Maybe T.Text                  -- ^ Query to search for
    , limit        :: Maybe Int                     -- ^ The maximum number of sticker sets to return
    }
  deriving (Eq)

instance Show SearchInstalledStickerSets where
  show
    SearchInstalledStickerSets
      { sticker_type = sticker_type_
      , query        = query_
      , limit        = limit_
      }
        = "SearchInstalledStickerSets"
          ++ I.cc
          [ "sticker_type" `I.p` sticker_type_
          , "query"        `I.p` query_
          , "limit"        `I.p` limit_
          ]

instance AT.ToJSON SearchInstalledStickerSets where
  toJSON
    SearchInstalledStickerSets
      { sticker_type = sticker_type_
      , query        = query_
      , limit        = limit_
      }
        = A.object
          [ "@type"        A..= AT.String "searchInstalledStickerSets"
          , "sticker_type" A..= sticker_type_
          , "query"        A..= query_
          , "limit"        A..= limit_
          ]
