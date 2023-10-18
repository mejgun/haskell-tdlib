module TD.Query.GetAllStickerEmojis
  (GetAllStickerEmojis(..)
  , defaultGetAllStickerEmojis
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType
import qualified Data.Text as T

-- | Returns unique emoji that correspond to stickers to be found by the getStickers(sticker_type, query, 1000000, chat_id). Returns 'TD.Data.Emojis.Emojis'
data GetAllStickerEmojis
  = GetAllStickerEmojis
    { sticker_type           :: Maybe StickerType.StickerType -- ^ Type of the stickers to search for
    , query                  :: Maybe T.Text                  -- ^ Search query
    , chat_id                :: Maybe Int                     -- ^ Chat identifier for which to find stickers
    , return_only_main_emoji :: Maybe Bool                    -- ^ Pass true if only main emoji for each found sticker must be included in the result
    }
  deriving (Eq, Show)

instance I.ShortShow GetAllStickerEmojis where
  shortShow
    GetAllStickerEmojis
      { sticker_type           = sticker_type_
      , query                  = query_
      , chat_id                = chat_id_
      , return_only_main_emoji = return_only_main_emoji_
      }
        = "GetAllStickerEmojis"
          ++ I.cc
          [ "sticker_type"           `I.p` sticker_type_
          , "query"                  `I.p` query_
          , "chat_id"                `I.p` chat_id_
          , "return_only_main_emoji" `I.p` return_only_main_emoji_
          ]

instance AT.ToJSON GetAllStickerEmojis where
  toJSON
    GetAllStickerEmojis
      { sticker_type           = sticker_type_
      , query                  = query_
      , chat_id                = chat_id_
      , return_only_main_emoji = return_only_main_emoji_
      }
        = A.object
          [ "@type"                  A..= AT.String "getAllStickerEmojis"
          , "sticker_type"           A..= sticker_type_
          , "query"                  A..= query_
          , "chat_id"                A..= chat_id_
          , "return_only_main_emoji" A..= return_only_main_emoji_
          ]

defaultGetAllStickerEmojis :: GetAllStickerEmojis
defaultGetAllStickerEmojis =
  GetAllStickerEmojis
    { sticker_type           = Nothing
    , query                  = Nothing
    , chat_id                = Nothing
    , return_only_main_emoji = Nothing
    }

