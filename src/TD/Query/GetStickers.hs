module TD.Query.GetStickers
  (GetStickers(..)
  , defaultGetStickers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType
import qualified Data.Text as T

-- | Returns stickers from the installed sticker sets that correspond to any of the given emoji or can be found by sticker-specific keywords. If the query is non-empty, then favorite, recently used or trending stickers may also be returned. Returns 'TD.Data.Stickers.Stickers'
data GetStickers
  = GetStickers
    { sticker_type :: Maybe StickerType.StickerType -- ^ Type of the stickers to return
    , query        :: Maybe T.Text                  -- ^ Search query; a space-separated list of emojis or a keyword prefix. If empty, returns all known installed stickers
    , limit        :: Maybe Int                     -- ^ The maximum number of stickers to be returned
    , chat_id      :: Maybe Int                     -- ^ Chat identifier for which to return stickers. Available custom emoji stickers may be different for different chats
    }
  deriving (Eq, Show)

instance I.ShortShow GetStickers where
  shortShow
    GetStickers
      { sticker_type = sticker_type_
      , query        = query_
      , limit        = limit_
      , chat_id      = chat_id_
      }
        = "GetStickers"
          ++ I.cc
          [ "sticker_type" `I.p` sticker_type_
          , "query"        `I.p` query_
          , "limit"        `I.p` limit_
          , "chat_id"      `I.p` chat_id_
          ]

instance AT.ToJSON GetStickers where
  toJSON
    GetStickers
      { sticker_type = sticker_type_
      , query        = query_
      , limit        = limit_
      , chat_id      = chat_id_
      }
        = A.object
          [ "@type"        A..= AT.String "getStickers"
          , "sticker_type" A..= sticker_type_
          , "query"        A..= query_
          , "limit"        A..= limit_
          , "chat_id"      A..= chat_id_
          ]

defaultGetStickers :: GetStickers
defaultGetStickers =
  GetStickers
    { sticker_type = Nothing
    , query        = Nothing
    , limit        = Nothing
    , chat_id      = Nothing
    }

